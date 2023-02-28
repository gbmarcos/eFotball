import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/tournaments/collection/tournament_collection_repository.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:collection/collection.dart';

class TournamentListPageCubit {
  final TournamentRepository _tournamentRepository;
  final TournamentCollectionRepository _tournamentCollectionRepository;

  late final AsyncCubit<List<TournamentInterface>> featuredTournamentsAndCollections;


  final int tournamentRequestLimit = 10;
  String? tournamentQuery;
  
  TournamentListPageCubit({
    required TournamentRepository tournamentRepository,
    required TournamentCollectionRepository tournamentCollectionRepository,
  })  : _tournamentRepository = tournamentRepository,
        _tournamentCollectionRepository = tournamentCollectionRepository {
    featuredTournamentsAndCollections = AsyncCubit(() => listTournamentsAndCollections().then(getOrThrow));
  }

  TournamentInterface? get liveNowTournament => featuredTournamentsAndCollections.state.maybeMap(
        orElse: () => null,
        data: (d) => d.value.firstWhereOrNull(
          (element) =>
              element.hasFlag(TournamentFlags.featured) &&
              !element.hasInternalFlag(InternalTournamentFlags.tournamentStarted),
        ),
      );

  Future<TournamentInterfaceEither> listTournamentsAndCollections() async {
    // get Tournament list and map them to TournamentRef list
    final TournamentInterfaceEither tournamentResponse = await _tournamentRepository.listTournaments(
      limit: tournamentRequestLimit,
      featured: tournamentQuery==null?'1':'0',
      query: tournamentQuery,
    );

    // get the TournamentCollection list and map them to a TournamentRef list
    final collectionResponse = await _tournamentCollectionRepository.list(
      limit: tournamentRequestLimit,
      featured: tournamentQuery==null?'1':'0',
      query: tournamentQuery,
    );

    //combine monads
    return tournamentResponse.fold(
      // if tournamentResponse has an error
      (tournamentError) {
        return tournamentError.map(
          TournamentInterfaceEither.left,
          //if the error is a NoDataException
          noDataException: (tournamentNoData) {
            return collectionResponse.fold(
              // if collectionError has an error too
              TournamentInterfaceEither.left,
              // if collectionError has data
              TournamentInterfaceEither.right,
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
              TournamentInterfaceEither.left,
              //if the error is a NoDataException
              noDataException: (value) => TournamentInterfaceEither.right(
                tournamentList,
              ),
            );
          },
          // if tournamentResponse and collectionResponse have data.
          (collectionList) => TournamentInterfaceEither.right(
            [...tournamentList, ...collectionList]..sort((a, b) => b.startsAt.compareTo(a.startsAt)),
          ),
        );
      },
    );
  }

  Future<void> searchTournament(String? query) async {
    //emit a loading state if there isn't one yet
    featuredTournamentsAndCollections.state.maybeWhen(
      orElse: () {
        featuredTournamentsAndCollections.emit(const AsyncValue.loading());
      },
      loading: (_) {},
    );

    tournamentQuery = query;

    //this method will be called every time the value of the search text field changes
    //therefore is necessary to avoid incomplete and unnecessary requests.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (tournamentQuery != query) {
      //there are a new query and the current query will be cancelled
      return;
    }

    await listTournamentsAndCollections()
        .then(getOrThrow)
        .then(
          (foundTournaments) {
        if (tournamentQuery != query) {
          //there are a new query and the current query will be cancelled
          return;
        }

        featuredTournamentsAndCollections.emit(AsyncValue.data(foundTournaments));
      },
      onError: (Object err, StackTrace stack) {
        if (tournamentQuery != query) {
          //there are a new query and the current query will be cancelled
          return;
        }

        featuredTournamentsAndCollections.emit(AsyncValue.error(err, stack));
      },
    );
  }
  
  
}

typedef TournamentInterfaceEither = Either<NetworkException, List<TournamentInterface>>;
