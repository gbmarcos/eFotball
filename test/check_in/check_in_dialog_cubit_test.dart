import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';

import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/play_match/lobby/check_in_dialog/check_in_dialog_cubit.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart' show Left, Right;
import 'package:mocktail/mocktail.dart';

import '../fixtures.json.dart';

class MockCheckInRepository extends Mock implements CheckInRepository {}

void main() {
  group('CheckInDialogCubit ', () {
    final mockCheckInRepo = MockCheckInRepository();
    final mockUser = User.fromJson(jsonDecode(mockUserResponseWithLobbyChekIn) as Map<String, dynamic>);
    final mockCheckInTime = DateTime.now();
    blocTest<CheckInDialogCubit, CheckInDialogState>(
      'emits waiting for response and leaveSuccess',
      setUp: () {
        when(() => mockCheckInRepo.leave(lobbyId: any(named: 'lobbyId')))
            .thenAnswer((invocation) async => Right<NetworkException, dynamic>(DateTime.now()));
      },
      build: () =>
          CheckInDialogCubit(lobbyCheckIn: mockUser.lobbyCheckIn!, user: mockUser, checkInRepository: mockCheckInRepo),
      act: (cubit) => cubit.leave(),
      expect: () => [const CheckInDialogState.waitingForResponse(), const CheckInDialogState.leaveSuccess()],
    );
    blocTest<CheckInDialogCubit, CheckInDialogState>(
      'emits waiting for response and checkInSuccess',
      setUp: () {
        when(() => mockCheckInRepo.checkIn(lobbyId: any(named: 'lobbyId')))
            .thenAnswer((invocation) async => Right<NetworkException, DateTime>(mockCheckInTime));
      },
      build: () =>
          CheckInDialogCubit(lobbyCheckIn: mockUser.lobbyCheckIn!, user: mockUser, checkInRepository: mockCheckInRepo),
      act: (cubit) => cubit.checkIn(),
      expect: () => [
        const CheckInDialogState.waitingForResponse(),
        CheckInDialogState.checkInSuccess(checkInTime: mockCheckInTime)
      ],
    );

    blocTest<CheckInDialogCubit, CheckInDialogState>(
      'emits waiting for response and checkInSuccess',
      setUp: () {
        when(() => mockCheckInRepo.checkIn(lobbyId: any(named: 'lobbyId')))
            .thenAnswer((invocation) async => Right<NetworkException, DateTime>(mockCheckInTime));
      },
      build: () =>
          CheckInDialogCubit(lobbyCheckIn: mockUser.lobbyCheckIn!, user: mockUser, checkInRepository: mockCheckInRepo),
      act: (cubit) => cubit.checkIn(),
      expect: () => [
        const CheckInDialogState.waitingForResponse(),
        CheckInDialogState.checkInSuccess(checkInTime: mockCheckInTime)
      ],
    );
    blocTest<CheckInDialogCubit, CheckInDialogState>(
      'emits waiting for response and checkInSuccess',
      setUp: () {
        when(() => mockCheckInRepo.checkIn(lobbyId: any(named: 'lobbyId')))
            .thenAnswer((invocation) async => Right<NetworkException, DateTime>(mockCheckInTime));
      },
      build: () =>
          CheckInDialogCubit(lobbyCheckIn: mockUser.lobbyCheckIn!, user: mockUser, checkInRepository: mockCheckInRepo),
      act: (cubit) => cubit.checkIn(),
      expect: () => [
        const CheckInDialogState.waitingForResponse(),
        CheckInDialogState.checkInSuccess(checkInTime: mockCheckInTime)
      ],
    );
    blocTest<CheckInDialogCubit, CheckInDialogState>(
      'emits no states when new events are added when waiting for response',
      setUp: () {
        when(() => mockCheckInRepo.checkIn(lobbyId: any(named: 'lobbyId')))
            .thenAnswer((invocation) async => Right<NetworkException, DateTime>(mockCheckInTime));
        when(() => mockCheckInRepo.leave(lobbyId: any(named: 'lobbyId')))
            .thenAnswer((invocation) async => Right<NetworkException, dynamic>(DateTime.now()));
      },
      seed: () => const CheckInDialogState.waitingForResponse(),
      build: () =>
          CheckInDialogCubit(lobbyCheckIn: mockUser.lobbyCheckIn!, user: mockUser, checkInRepository: mockCheckInRepo),
      act: (cubit) => cubit.checkIn(),
      expect: () => <CheckInDialogState>[],
    );
    blocTest<CheckInDialogCubit, CheckInDialogState>(
      'emits waiting for response, checkInSuccess, waiting and error',
      setUp: () {
        final responses = [
          Right<NetworkException, DateTime>(mockCheckInTime),
          const Left<NetworkException, DateTime>(NetworkException.noDataException())
        ];
        when(() => mockCheckInRepo.checkIn(lobbyId: any(named: 'lobbyId')))
            .thenAnswer((invocation) async => responses.removeAt(0));
      },
      build: () =>
          CheckInDialogCubit(lobbyCheckIn: mockUser.lobbyCheckIn!, user: mockUser, checkInRepository: mockCheckInRepo),
      act: (cubit) async {
        await cubit.checkIn();
        await cubit.checkIn();
      },
      expect: () => [
        const CheckInDialogState.waitingForResponse(),
        CheckInDialogState.checkInSuccess(checkInTime: mockCheckInTime),
        const CheckInDialogState.waitingForResponse(),
        const CheckInDialogState.error(exception: NetworkException.noDataException())
      ],
    );
  });
}
