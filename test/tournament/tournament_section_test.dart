import 'dart:convert';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:fifa/src/features/tournaments/collection/tournament_collection_repository.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:fifa/src/features/tournaments/tournament_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../fixtures.json.dart';
import '../helpers/pump_app.dart';

class MockRepository extends Mock implements TournamentRepository, TournamentCollectionRepository {}

void main() {
  final mockRepo = MockRepository();

  setUp(() {
    when(mockRepo.listTournaments)
        .thenAnswer((_) async => Either<NetworkException, List<Tournament>>.right(mockTournamentList()));
  });

  setUp(() {
    when(mockRepo.list)
        .thenAnswer((_) async => Either<NetworkException, List<TournamentCollection>>.right(mockCollectionList()));
  });

  testWidgets('Tournament Section gets created', (WidgetTester tester) async {
    final asyncCubitWithTournamentData = AsyncCubit(
      () => mockRepo.listTournaments().then(getOrThrow),
      initialValue: AsyncData(mockTournamentList()),
    );

    final asyncCubitWithTournamentCollectionData = AsyncCubit(
      () => mockRepo.list().then(getOrThrow),
      initialValue: AsyncData(mockCollectionList()),
    );

    final asyncCubitWithTournamentRefData = AsyncCubit(
      () => listTournamentsAndCollections(mockRepo).then(getOrThrow),
      initialValue: AsyncData(mockTournamentRefList()),
    );

    await mockNetworkImages(() async {
      await tester.pumpApp(MultiRepositoryProvider(
        providers: [
          RepositoryProvider<TournamentRepository>.value(value: mockRepo),
          RepositoryProvider.value(value: Environment.staging),
        ],
        child: Builder(builder: (
          context,
        ) {
          return Material(child: AsyncTournamentSection(tournamentsAndCollections: asyncCubitWithTournamentRefData));
        }),
      ));
      await tester.pump();
      expect(find.byKey(Keys.tournamentsHomeSection), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}

List<Tournament> mockTournamentList() => tournamentFromJson(jsonDecode(mockTournaments) as List<dynamic>);

List<TournamentInterface> mockTournamentRefList() {
  return mockTournamentList().map((t) => t as TournamentInterface).toList() +
      mockCollectionList().map((t) => t as TournamentInterface).toList();
}

List<TournamentCollection> mockCollectionList() =>
    tournamentCollectionFromJson(jsonDecode(mockTournamentCollectionList) as List<dynamic>);

Future<Either<NetworkException, List<TournamentInterface>>> listTournamentsAndCollections(
  MockRepository mockRepo,
) async {
  // get Tournament list and map them to TournamentRef list
  final tournamentResponse = (await mockRepo.listTournaments(
    featured: '1',
    limit: 20,
  ))
      .map<List<TournamentInterface>>((list) => list.map((t) => t as TournamentInterface).toList());

  // get the TournamentCollection list and map them to a TournamentRef list
  final collectionResponse = await mockRepo.list(featured: '1', limit: 20);

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
