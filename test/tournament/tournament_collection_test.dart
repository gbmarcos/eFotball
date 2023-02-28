// import 'dart:convert';
// import 'package:fifa/src/common/environment.dart';
// import 'package:fifa/src/common/exceptions.dart';
// import 'package:fifa/src/common/services/network_service.dart';
// import 'package:fifa/src/home_refactor/tournaments/collection/model/tournament_collection.dart';
// import 'package:fifa/src/home_refactor/tournaments/collection/tournament_collection_repository.dart';
// import 'package:fifa/src/tournament_page/models/participant.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:mocktail/mocktail.dart';
//
// import '../fixtures.json.dart';
//
// class MockNetworkService extends Mock implements AuthenticatedNetworkService {}
//
// // DO NOT RUN THIS TESTS
// void main() {
//   // group('Check Tournament Collection Model', () {
//   //   test('Correctly serializes and deserializes a Tournament Collection instance', () {
//   //     final serializedResponse =
//   //         TournamentCollection.fromJson(jsonDecode(mockTournamentCollection) as Map<String, dynamic>);
//   //     expect(serializedResponse, isA<TournamentCollection>());
//   //     expect(serializedResponse.id, 3);
//   //   });
//   //
//   //   test('Correctly serializes and deserializes responses', () {
//   //     final serializedResponse = mockResponseList();
//   //     expect(serializedResponse, isA<List<TournamentCollection>>());
//   //     expect(serializedResponse.length, 9);
//   //   });
//   // });
//
//   group('Check Tournament Repository', () {
//     late final AuthenticatedNetworkService client = MockNetworkService();
//     final repo = TournamentCollectionRepository(client: client);
//     // test('Repository returns valid tournaments collection list', () async {
//     //   when(() => client.get(any(), query: any(named: 'query')))
//     //       .thenAnswer((_) async => Either<NetworkException, dynamic>.right(jsonDecode(mockTournamentCollectionList)));
//     //
//     //   final serializedResponse = await repo.list();
//     //   expect(serializedResponse.isRight(), true);
//     //   expect(serializedResponse, isA<Right<NetworkException, List<TournamentCollection>>>());
//     //   serializedResponse.match(
//     //     (l) => throw Exception('Value should not be Left'),
//     //     (r) => expect(r.length, 9),
//     //   );
//     // });
//     test('Repository returns an error on exception', () async {
//       when(() => client.get(any(), query: any(named: 'query'))).thenAnswer(
//           (_) async => Either<NetworkException, dynamic>.left(const NetworkException(message: 'MockError')));
//
//       final serializedResponse = await repo.list();
//       expect(serializedResponse.isLeft(), true);
//       expect(serializedResponse, isA<Left<NetworkException, List<TournamentCollection>>>());
//       serializedResponse.match(
//         (l) => expect(
//             l.when(
//               (message, statusCode, response, stackTrace) => message,
//               noDataException: () => 'no data',
//             ),
//             'MockError'),
//         (r) => throw Exception('Value should not be Right'),
//       );
//     });
//
//     test('Repository returns valid tournaments collection itemas dsa dsa d', () async {
//       when(() => client.get(any(), query: any(named: 'query')))
//           .thenAnswer((_) async => Either<NetworkException, dynamic>.right(jsonDecode(mockTournamentCollection)));
//
//       final serializedResponse = await repo.get(id: 3);
//       expect(serializedResponse.isRight(), true);
//       expect(serializedResponse, isA<Right<NetworkException, TournamentCollection>>());
//       serializedResponse.match(
//         (l) => throw Exception('Value should not be Left'),
//         (r) => expect(r, TournamentCollection.fromJson(jsonDecode(mockTournamentCollection) as Map<String, dynamic>)),
//       );
//     });
//
//     test('Repository returns valid tournaments collection item from API', () async {
//       final serializedResponse = await TournamentCollectionRepository(
//               client: AuthenticatedNetworkService(environment: Environment.staging, userId: 90, token: 'lKkhNXz5s4js'))
//           .get(id: 3);
//       expect(serializedResponse.isRight(), true);
//       expect(serializedResponse, isA<Right<NetworkException, TournamentCollection>>());
//       serializedResponse.match(
//         (l) => throw Exception('Value should not be Left'),
//         (r) => expect(r.id, 3),
//       );
//     });
//     test('Repository returns valid tournaments collection list from API', () async {
//       final serializedResponse = await TournamentCollectionRepository(
//               client: AuthenticatedNetworkService(environment: Environment.staging, userId: 90, token: 'lKkhNXz5s4js'))
//           .list();
//       expect(serializedResponse.isRight(), true);
//       expect(serializedResponse, isA<Right<NetworkException, List<TournamentCollection>>>());
//       serializedResponse.match(
//         (l) => throw Exception('Value should not be Left'),
//         (r) => expect(r.length, greaterThanOrEqualTo(9)),
//       );
//     });
//     test('Repository returns valid tournaments participant  from API', () async {
//       final serializedResponse = await TournamentCollectionRepository(
//               client: AuthenticatedNetworkService(environment: Environment.staging, userId: 90, token: 'lKkhNXz5s4js'))
//           .participant(collectionId: 7, userId: 90);
//       expect(serializedResponse.isRight(), true);
//       expect(serializedResponse, isA<Right<NetworkException, TournamentParticipant>>());
//       serializedResponse.match(
//         (l) => throw Exception('Value should not be Left'),
//         (r) => expect(r.id, 90),
//       );
//     });
//
//     test('Repository returns valid tournaments participants  from API', () async {
//       final serializedResponse = await TournamentCollectionRepository(
//               client: AuthenticatedNetworkService(environment: Environment.staging, userId: 90, token: 'lKkhNXz5s4js'))
//           .participantsList(collectionId: 7);
//       expect(serializedResponse.isRight(), true);
//       expect(serializedResponse, isA<Right<NetworkException, List<TournamentCollectionParticipant>>>());
//       serializedResponse.match(
//         (l) => throw Exception('Value should not be Left'),
//         (r) => expect(r.length, 2),
//       );
//     });
//     test('Repository returns valid tournaments brackets  from API', () async {
//       final serializedResponse = await TournamentCollectionRepository(
//               client: AuthenticatedNetworkService(environment: Environment.staging, userId: 90, token: 'lKkhNXz5s4js'))
//           .brackets(collectionId: 7);
//       expect(serializedResponse.isRight(), true);
//       expect(serializedResponse, isA<Right<NetworkException, TournamentCollectionBracketResponse>>());
//       serializedResponse.match(
//         (l) => throw Exception('Value should not be Left'),
//         (r) {
//           expect(r.length, 2);
//           expect(r.containsKey(344), true);
//         },
//       );
//     });
//   });
// }
//
// List<TournamentCollection> mockResponseList() =>
//     tournamentCollectionFromJson(jsonDecode(mockTournamentCollectionList) as List<dynamic>);
