import 'dart:convert';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.json.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  group('Check News Model', () {
    test('Correctly serializes and deserializes responses', () {
      final serializedNews = mockNewsList();
      expect(serializedNews, isA<List<News>>());
      expect(serializedNews.length, 20);
    });
  });

  group('Check News Model', () {
    late final NetworkService client = MockNetworkService();
    final newsRepo = NewsRepository(client: client);
    test('Repository returns valid news', () async {
      when(() => client.get(any(), query: any(named: 'query')))
          .thenAnswer((_) async => Either<NetworkException, dynamic>.right(jsonDecode(mockNews)));

      final serializedNews = await newsRepo.listNews();
      expect(serializedNews.isRight(), true);
      expect(serializedNews, isA<Right<NetworkException, List<News>>>());
      serializedNews.match(
        (l) => throw Exception('Value should not be Left'),
        (r) => expect(r.length, 20),
      );
    });
    test('Repository returns an error', () async {
      when(() => client.get(any(), query: any(named: 'query'))).thenAnswer(
          (_) async => Either<NetworkException, dynamic>.left(const NetworkException(message: 'MockError')));

      final serializedNews = await newsRepo.listNews();
      expect(serializedNews.isLeft(), true);
      expect(serializedNews, isA<Left<NetworkException, List<News>>>());
      serializedNews.match(
        (l) => expect(
            l.when(
              (message, statusCode, response, stackTrace) => message,
              noDataException: () => 'no data',
            ),
            'MockError'),
        (r) => throw Exception('Value should not be Right'),
      );
    });
    test('Repository returns null amount of comments on error', () async {
      when(() => client.get(any(), query: any(named: 'query'))).thenAnswer(
          (_) async => Either<NetworkException, dynamic>.left(const NetworkException(message: 'MockError')));

      final comments = await newsRepo.listComments(newsId: 18);

      expect(comments, isA<Left>());
      expect(comments.getLeft(), isA<Some<NetworkException>>());
    });
  });
}

List<News> mockNewsList() => newsFromJson(jsonDecode(mockNews) as List<dynamic>);
