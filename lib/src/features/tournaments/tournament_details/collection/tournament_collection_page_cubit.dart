import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:fifa/src/features/streams/model/stream.dart' ;
import 'package:fifa/src/features/streams/stream_repository.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:fifa/src/features/tournaments/collection/tournament_collection_repository.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:fpdart/fpdart.dart';

typedef TournamentCollectionMatchesResponse = Map<TournamentId, List<Match>>;
typedef MatchesMapEither = Either<NetworkException, Map<TournamentId, List<Match>>>;

class TournamentCollectionPageCubit {
  final int tournamentId;
  final TournamentCollectionRepository _tournamentCollectionRepository;
  final StreamRepository _streamRepository;
  final TournamentRepository _tournamentRepository;
  final CheckInRepository _checkInRepository;
  final MatchRepository _matchRepository;

  late final AsyncCubit<TournamentCollection> tournamentCollection;
  late final AsyncCubit<List<TournamentCollectionParticipant>> tournamentParticipants;
  late final AsyncCubit<TournamentCollectionBracketResponse> bracketsForEachTournament;
  late final AsyncCubit<TournamentCollectionMatchesResponse> matchesForEachTournament;
  late final AsyncCubit<SignupStatus> collectionSignUpStatus;
  late final AsyncCubit<List<Stream>> streams;

  TournamentCollectionPageCubit({
    required this.tournamentId,
    required TournamentCollectionRepository tournamentCollectionRepository,
    required StreamRepository streamRepository,
    required TournamentRepository tournamentRepository,
    required CheckInRepository checkInRepository,
    required MatchRepository matchRepository,
  })  : _tournamentCollectionRepository = tournamentCollectionRepository,
        _checkInRepository = checkInRepository,
        _streamRepository = streamRepository,
        _tournamentRepository = tournamentRepository,
        _matchRepository = matchRepository {
    streams = AsyncCubit(
      () => _streamRepository
          .listLiveStreams(
            tournamentId: tournamentId,
            limit: 20,
          )
          .then(getOrThrow),
    );

    tournamentCollection = AsyncCubit(() => _tournamentCollectionRepository.get(id: tournamentId).then((either) {
          either.fold((l) {}, getMatchesForEachStage);
          return getOrThrow(either);
        }));

    tournamentParticipants = AsyncCubit(() => _tournamentCollectionRepository
        .participantsList(
          collectionId: tournamentId,
        )
        .then(getOrThrow));

    bracketsForEachTournament = AsyncCubit(() => _tournamentCollectionRepository
        .brackets(
          collectionId: tournamentId,
        )
        .then(getOrThrow));

    collectionSignUpStatus = AsyncCubit(
      () => _checkInRepository
          .collectionStatus(
            collectionId: tournamentId,
          )
          .then(getOrThrow),
      refreshPolicy: RefreshPolicy.noLoading,
    );
  }

  AsyncCubit<List<Team>> getTeams(int leagueId) => AsyncCubit(
        () => _tournamentRepository
            .listLeagueTeams(
              leagueId: leagueId,
            )
            .then(getOrThrow),
      );

  Future<Either<NetworkException, void>> tournamentSignUp({int? teamId}) => _tournamentCollectionRepository.signUp(
        collectionId: tournamentId,
        teamId: teamId,
      );

  Future<Either<NetworkException, void>> tournamentSignUpCancel() => _tournamentCollectionRepository.cancel(
        collectionId: tournamentId,
      );

  void getMatchesForEachStage(TournamentCollection collection) {
    matchesForEachTournament = AsyncCubit(() => getMatches(collection).then(getOrThrow));
  }

  Future<MatchesMapEither> getMatches(TournamentCollection collection) async {
    final stages = collection.stages;

    if (stages == null || stages.isEmpty) return MatchesMapEither.left(const NoDataException());

    final map = <TournamentId, List<Match>>{};

    final ids = stages.map((e) => e.id).toSet();

    for (final stageId in ids) {
      NetworkException? exception;

      final response = await _matchRepository.listMatches(
        tournamentId: stageId,
      );

      response.fold(
        (error) {
          if (error is NoDataException) {
            map[stageId] = [];
          } else {
            exception = error;
          }
        },
        (matches) {
          map[stageId] = matches;
        },
      );

      if (exception != null) return MatchesMapEither.left(exception!);
    }

    return MatchesMapEither.right(map);
  }
}
