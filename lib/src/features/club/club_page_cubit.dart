import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/club/club_repository.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/club/model/org_featured_player.dart';
import 'package:fifa/src/features/club/model/ranking.dart';
import 'package:fifa/src/features/club/model/social_media.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_repository.dart';
import 'package:fifa/src/features/tournaments/collection/tournament_collection_repository.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:fpdart/fpdart.dart';

class ClubPageCubit {
  final int clubId;
  final NewsRepository _newsRepository;
  final ClubRepository _clubRepository;
  final TournamentRepository _tournamentRepository;
  final TournamentCollectionRepository _tournamentCollectionRepository;
  final MatchRepository _matchRepository;

  //feed view data
  late final AsyncCubit<Club> selectedClub;
  late final AsyncCubit<List<News>> news;
  late final AsyncCubit<List<SocialMedia>?> socialMedia;
  late final AsyncCubit<List<OrgFeaturedPlayer>> featuredPlayers;
  late final AsyncCubit<GameRanking?> gameRanking;

  //events view data
  late final AsyncCubit<List<Tournament>> liveTournaments;
  late final AsyncCubit<List<Tournament>> finishedTournaments;
  late final AsyncCubit<List<Tournament>> allTournaments;
  late final AsyncCubit<List<TournamentInterface>> allTournamentsAndCollections;

  //matches view data
  late final AsyncCubit<List<LatestMatch>> latestMatches;
  late final AsyncCubit<NextMatch> nextMatch;

  ClubPageCubit({
    Club? club,
    required NewsRepository newsRepository,
    required this.clubId,
    required ClubRepository clubRepository,
    required TournamentRepository tournamentRepository,
    required TournamentCollectionRepository tournamentCollectionRepository,
    required MatchRepository matchRepository,
  })  : _newsRepository = newsRepository,
        _tournamentRepository = tournamentRepository,
        _tournamentCollectionRepository = tournamentCollectionRepository,
        _matchRepository = matchRepository,
        _clubRepository = clubRepository {
    final selectedClubId = clubId;
    gameRanking = AsyncCubit.stub();

    if (club != null) {
      selectedClub = AsyncCubit(() => Future.value(club));
      gameRanking.changeFuture = () => _clubRepository.getGameRanking(club).then(getOrThrow);
    } else {
      selectedClub = AsyncCubit(() => _clubRepository.get(id: '$clubId').then(getOrThrow));
      selectedClub.state.whenData((value) {
        gameRanking.changeFuture = () => _clubRepository.getGameRanking(value).then(getOrThrow);
      });
    }

    news = AsyncCubit(() => _newsRepository.listNews(orgId: selectedClubId).then(getOrThrow));
    socialMedia = AsyncCubit(() => _clubRepository.getSocialMedia(orgId: selectedClubId).then(getOrThrow));
    featuredPlayers = AsyncCubit(() => _clubRepository.getFeaturedPlayers(orgId: selectedClubId).then(getOrThrow));

    allTournaments = AsyncCubit(
        () => _tournamentRepository.listTournaments(orgId: selectedClubId, orgFeatured: '1').then(getOrThrow));
    latestMatches = AsyncCubit(() => _matchRepository.listOrgMatches(orgId: selectedClubId).then(getOrThrow));
    nextMatch = AsyncCubit(() => _matchRepository.getFeaturedNextMatch(orgId: selectedClubId).then(getOrThrow));

    allTournamentsAndCollections = AsyncCubit(() => listTournamentsAndCollections().then(getOrThrow));
  }

  Future<Either<NetworkException, List<TournamentInterface>>> listTournamentsAndCollections() async {
    // get Tournament list and map them to TournamentRef list
    final tournamentResponse = (await _tournamentRepository.listTournaments(
      featured: '0',
      limit: 20,
      orgId: clubId,
      orgFeatured: '1',
    ))
        .map<List<TournamentInterface>>((list) => list.map((t) => t).toList());

    // get the TournamentCollection list and map them to a TournamentRef list
    final collectionResponse = await _tournamentCollectionRepository.list(
      featured: '0',
      limit: 20,
      orgId: clubId,
      orgFeatured: '1',
    );

    //combine monads
    return tournamentResponse.fold(
      // if tournamentResponse has an error
      (tournamentError) {
        return tournamentError.map(
          Either<NetworkException, List<TournamentInterface>>.left,
          //if the error is a NoDataException
          noDataException: (tournamentNoData) {
            return collectionResponse.fold(
              // if collectionError has an error too
              Either<NetworkException, List<TournamentInterface>>.left,
              // if collectionError has data
              Either<NetworkException, List<TournamentInterface>>.right,
            );
          },
        );
      },
      // if tournamentResponse has data
      (tournamentList) {
        return collectionResponse.fold(
          // if collectionResponse has an error
          (collectionError) {
            return collectionError.map(
              Either<NetworkException, List<TournamentInterface>>.left,
              //if the error is a NoDataException
              noDataException: (value) => Either<NetworkException, List<TournamentInterface>>.right(
                tournamentList,
              ),
            );
          },
          // if tournamentResponse and collectionResponse have data.
          (collectionList) => Either<NetworkException, List<TournamentInterface>>.right(
            tournamentList + collectionList,
          ),
        );
      },
    );
  }
}
