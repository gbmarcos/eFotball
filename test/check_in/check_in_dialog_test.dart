import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:fifa/resources/l10n/l10n.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/play_match/lobby/check_in_dialog/check_in_dialog.dart';
import 'package:fifa/src/features/play_match/lobby/check_in_dialog/check_in_dialog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';

import '../fixtures.json.dart';

class MockCheckInDialogCubit extends Mock implements CheckInDialogCubit {}

void main() {
  final mockLobbyCheckIn =
      User.fromJson(jsonDecode(mockUserResponseWithLobbyChekIn) as Map<String, dynamic>).lobbyCheckIn!;
  late MockNavigator navigator;
  late MockCheckInDialogCubit mockDialogCubit;

  ////Finders
  final snackBarFailureFinder = find.byKey(Keys.checkInSnackbarError);
  final snackBarLeaveFinder = find.byKey(Keys.checkInSnackbarLeaveSuccess);
  final snackBarCheckInFinder = find.byKey(Keys.checkInSnackbarCheckInSuccess);

  Widget makeTestableWidget() {
    return BlocProvider<CheckInDialogCubit>.value(
      value: mockDialogCubit,
      child: MaterialApp(
          localizationsDelegates: const [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate],
          supportedLocales: AppLocalizations.supportedLocales,
          home: MockNavigatorProvider(
            navigator: navigator,
            child: Provider.value(
                value: Environment.staging, child: Scaffold(body: LobbyCheckInDialog(lobbyCheckIn: mockLobbyCheckIn))),
          )),
    );
  }

  setUp(() {
    mockDialogCubit = MockCheckInDialogCubit();
    // ...
    navigator = MockNavigator();
    // When calling `Navigator.of(context).push(...)`, return void by default.
    when(() => navigator.push(any())).thenAnswer((_) async {});
  });

  group('CheckInDialog', () {
    testWidgets('Displays snackbar on error', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final expectedStates = [
          const CheckInDialogState.waitingForResponse(),
          const CheckInDialogState.error(exception: NetworkException.noDataException())
        ];
        whenListen(mockDialogCubit, Stream.fromIterable(expectedStates),
            initialState: CheckInDialogState.initial(checkIn: mockLobbyCheckIn));
        //Stub the bloc BEFORE pumping the app

        //Act
        await tester.pumpWidget(makeTestableWidget());
        expect(find.byType(SnackBar), findsNothing);
        await tester.pump();
        await tester.pump();

        //Assert
        expect(snackBarFailureFinder, findsOneWidget);
      });
    });

    testWidgets('Displays snackbar on `leave success` and pops dialog with cubit last state',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final expectedStates = [const CheckInDialogState.waitingForResponse(), const CheckInDialogState.leaveSuccess()];
        whenListen(mockDialogCubit, Stream.fromIterable(expectedStates),
            initialState: CheckInDialogState.initial(checkIn: mockLobbyCheckIn));
        //Stub the bloc BEFORE pumping the app

        //Act
        await tester.pumpWidget(makeTestableWidget());
        expect(find.byType(SnackBar), findsNothing);
        await tester.pump();

        //Assert
        expect(snackBarLeaveFinder, findsOneWidget);
        verify(() => navigator.pop(expectedStates[1])).called(1);
      });
    });
    testWidgets('Displays snackbar checkin success and navigates to Lobby Page', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final expectedStates = [
          const CheckInDialogState.waitingForResponse(),
          CheckInDialogState.checkInSuccess(checkInTime: DateTime.now())
        ];
        whenListen(mockDialogCubit, Stream.fromIterable(expectedStates),
            initialState: CheckInDialogState.initial(checkIn: mockLobbyCheckIn));
        //Stub the bloc BEFORE pumping the app

        //Act
        await tester.pumpWidget(makeTestableWidget());
        expect(find.byType(SnackBar), findsNothing);
        await tester.pump();

        //Assert
        expect(snackBarCheckInFinder, findsOneWidget);
        verify(() => navigator.pop(expectedStates[1])).called(1);
      });
    });
  });
}
