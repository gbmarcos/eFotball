import 'dart:convert';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/club/club_repository.dart';
import 'package:fifa/src/features/club/club_row.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import '../fixtures.json.dart';
import '../helpers/pump_app.dart';

class MockClubRepository extends Mock implements ClubRepository {}

void main() {
  final mockClubRepo = MockClubRepository();

  setUp(() {
    when(mockClubRepo.listClubs).thenAnswer((_) async => Either<NetworkException, List<Club>>.right(mockClubList()));
  });

  testWidgets('Club Section gets created', (WidgetTester tester) async {
    final asyncCubitWithData = AsyncCubit(
      () => mockClubRepo.listClubs().then(getOrThrow),
      initialValue: AsyncData(mockClubList()),
    );
    await tester.pumpApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ClubRepository>.value(value: mockClubRepo),
        RepositoryProvider.value(value: Environment.staging),
      ],
      child: Builder(builder: (
        context,
      ) {
        return Material(child: AsyncClubSection(clubs: asyncCubitWithData));
      }),
    ));
    await tester.pumpAndSettle();

    expect(find.byKey(Keys.clubHomeSection), findsOneWidget);
  });

  testWidgets('Network error widget is shown when error happens', (WidgetTester tester) async {
    when(mockClubRepo.listClubs)
        .thenAnswer((_) async => Either<NetworkException, List<Club>>.left(const NetworkException(message: '')));
    final asyncCubitWithError = AsyncCubit<List<Club>>(
      () => mockClubRepo.listClubs().then(getOrThrow),
      initialValue: const AsyncError(NetworkException(message: '')),
    );
    await tester.pumpApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ClubRepository>.value(value: mockClubRepo),
        RepositoryProvider.value(value: Environment.staging),
      ],
      child: Builder(builder: (
        context,
      ) {
        return Material(child: AsyncClubSection(clubs: asyncCubitWithError));
      }),
    ));
    await tester.pumpAndSettle();

    expect(find.byType(NetworkExceptionWidget), findsOneWidget);
  });
}

List<Club> mockClubList() => clubsFromJson(jsonDecode(mockClubsResponse) as List<dynamic>);
