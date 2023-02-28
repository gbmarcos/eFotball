import 'dart:convert';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.json.dart';

class MockNetworkService extends Mock implements NetworkService {}
class MockAuthenticatedNetworkService extends Mock implements AuthenticatedNetworkService {}

void main() {
  group('Check Tournament Model', () {
    test('Correctly serializes and deserializes responses', () {
      final serializedResponse = mockResponseList();
      expect(serializedResponse, isA<List<Tournament>>());
      expect(serializedResponse.length, 33);
    });
  });

  group('Check Tournament Model', () {
    late final AuthenticatedNetworkService client = MockAuthenticatedNetworkService();
    final repo = TournamentRepository(client: client);
    test('Repository returns valid tournaments', () async {
      when(() => client.get(any(), query: any(named: 'query')))
          .thenAnswer((_) async => Either<NetworkException, dynamic>.right(jsonDecode(mockTournaments)));

      final serializedResponse = await repo.listTournaments();
      expect(serializedResponse.isRight(), true);
      expect(serializedResponse, isA<Right<NetworkException, List<Tournament>>>());
      serializedResponse.match(
        (l) => throw Exception('Value should not be Left'),
        (r) => expect(r.length, 33),
      );
    });
    test('Repository returns an error', () async {
      when(() => client.get(any(), query: any(named: 'query'))).thenAnswer(
          (_) async => Either<NetworkException, dynamic>.left(const NetworkException(message: 'MockError')));

      final serializedResponse = await repo.listTournaments();
      expect(serializedResponse.isLeft(), true);
      expect(serializedResponse, isA<Left<NetworkException, List<Tournament>>>());
      serializedResponse.match(
        (l) => expect(
            l.when(
              (message, statusCode, response, stackTrace) => message,
              noDataException: () => 'no data',
            ),
            'MockError'),
        (r) => throw Exception('Value should not be Right'),
      );
    });
  });
}

List<Tournament> mockResponseList() => tournamentFromJson(jsonDecode(mockTournaments) as List<dynamic>);
