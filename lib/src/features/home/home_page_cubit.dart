import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/club/club_repository.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_repository.dart';
import 'package:fifa/src/features/tournaments/collection/tournament_collection_repository.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:fpdart/fpdart.dart';


class HomePageCubit {
  final NewsRepository _newsRepository;
  final ClubRepository _clubRepository;
  final TournamentRepository _tournamentRepository;
  final TournamentCollectionRepository _tournamentCollectionRepository;
  final MatchRepository _matchRepository;

  late final AsyncCubit<List<Club>> featuredClubs;
  late final AsyncCubit<List<News>> news;
  late final AsyncCubit<List<TournamentInterface>> tournamentsAndCollections;
  late final AsyncCubit<List<Match>> matches;

  final int matchesLimit = 20;
  String? matchesQuery;

  HomePageCubit({
    required NewsRepository newsRepository,
    required ClubRepository clubRepository,
    required TournamentRepository tournamentRepository,
    required TournamentCollectionRepository tournamentCollectionRepository,
    required MatchRepository matchRepository,
  })  : _newsRepository = newsRepository,
        _tournamentRepository = tournamentRepository,
        _tournamentCollectionRepository = tournamentCollectionRepository,
        _matchRepository = matchRepository,
        _clubRepository = clubRepository {
    featuredClubs = AsyncCubit(() => _clubRepository.listClubs().then(getOrThrow));
    news = AsyncCubit(() => _newsRepository.listNews(featured: true).then(getOrThrow));
    matches = AsyncCubit(
      () => _matchRepository
          .listMatches(
            featured: '1',
            query: matchesQuery,
            limit: matchesLimit,
          ).then(getOrThrow),
    );
    tournamentsAndCollections = AsyncCubit(() => listTournamentsAndCollections().then(getOrThrow));
  }

  Future<Either<NetworkException, List<TournamentInterface>>> listTournamentsAndCollections() async {
    // get Tournament list and map them to TournamentRef list
    final tournamentResponse = (await _tournamentRepository.listTournaments(
      featured: '1',
      limit: 20,
      upcoming: '0',
      live: '0',
      finished: '0',
    ))
        .map<List<TournamentInterface>>((list) => list.map((t) => t).toList());

    // get the TournamentCollection list and map them to a TournamentRef list
    final collectionResponse = (await _tournamentCollectionRepository.list(
      featured: '1',
      limit: 20,
      upcoming: '0',
      live: '0',
      finished: '0',
    ))
        .map<List<TournamentInterface>>((list) => list.toList());

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
            [...tournamentList, ...collectionList]..sort((a, b) => b.startsAt.compareTo(a.startsAt)),
          ),
        );
      },
    );
  }

  Future<void> searchMatches(String? query) async {
    //emit a loading state if there isn't one yet
    matches.state.maybeWhen(
      orElse: () {
        matches.emit(const AsyncValue.loading());
      },
      loading: (_) {},
    );

    matchesQuery = query;

    //this method will be called every time the value of the search text field changes
    //therefore is necessary to avoid incomplete and unnecessary requests.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (matchesQuery != query) {
      //there are a new query and the current query will be cancelled
      return;
    }

    await _matchRepository
        .listMatches(
          query: matchesQuery,
          limit: matchesLimit,
        )
        .then(getOrThrow)
        .then(
      (foundMatches) {
        if (matchesQuery != query) {
          //there are a new query and the current query will be cancelled
          return;
        }

        matches.emit(AsyncValue.data(foundMatches));
      },
      onError: (Object err, StackTrace stack) {
        if (matchesQuery != query) {
          //there are a new query and the current query will be cancelled
          return;
        }

        matches.emit(AsyncValue.error(err, stack));
      },
    );
  }
}
