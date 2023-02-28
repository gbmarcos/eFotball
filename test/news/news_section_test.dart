import 'dart:convert';

import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_list.dart';
import 'package:fifa/src/features/news/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../fixtures.json.dart';
import '../helpers/pump_app.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  final mockNewsRepo = MockNewsRepository();

  setUp(() {
    when(() => mockNewsRepo.listNews(featured: any(named: 'featured')))
        .thenAnswer((_) async => Either<NetworkException, List<News>>.right(mockNewsList()));
  });

  testWidgets('News Section gets created', (WidgetTester tester) async {
    await mockNetworkImages(() async {
      await tester.pumpApp(MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NewsRepository>.value(value: mockNewsRepo),
          RepositoryProvider.value(value: Environment.staging),
        ],
        child: Builder(builder: (
          context,
        ) {
          return const Material(child: NewsSection());
        }),
      ));
      await tester.pump();
      expect(find.byKey(Keys.newsHomeSection), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}

List<News> mockNewsList() => newsFromJson(jsonDecode(mockNews) as List<dynamic>);
