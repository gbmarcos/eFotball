
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_dialog_cubit.freezed.dart';

@freezed
class CheckInDialogState with _$CheckInDialogState {
  const factory CheckInDialogState.initial({required LobbyCheckIn checkIn}) = _Initial;

  const factory CheckInDialogState.error({required NetworkException exception}) = _Error;

  const factory CheckInDialogState.waitingForResponse() = _WatingForResponse;

  const factory CheckInDialogState.leaveSuccess({String? reason}) = _LeaveSuccess;

  const factory CheckInDialogState.checkInSuccess({required DateTime checkInTime}) = _CheckInSuccess;

  const CheckInDialogState._();
}

class CheckInDialogCubit extends Cubit<CheckInDialogState> {
  final LobbyCheckIn lobbyCheckIn;
  final User user;
  final CheckInRepository _checkInRepository;

  CheckInDialogCubit(
      {CheckInDialogState? initialState,
      required this.lobbyCheckIn,
      required this.user,
      required CheckInRepository checkInRepository})
      : _checkInRepository = checkInRepository,
        super(initialState ?? CheckInDialogState.initial(checkIn: lobbyCheckIn));

  Future<void> leave({String? reason}) async {
    if (state is _WatingForResponse || state is _LeaveSuccess) return;

    emit(const CheckInDialogState.waitingForResponse());

    final leave = await _checkInRepository.leave(lobbyId: lobbyCheckIn.id);

    leave.fold((l) {
      emit(CheckInDialogState.leaveSuccess(reason: reason));
    }, (dynamic r) {
      emit(CheckInDialogState.leaveSuccess(reason: reason));
    });
  }

  Future<void> opponentLeft({String reason = "Opponent left"}) async {
    emit(CheckInDialogState.leaveSuccess(reason: reason));
  }

  Future<void> checkIn() async {
    print('at checkin');
    if (state is _WatingForResponse) return;

    emit(const CheckInDialogState.waitingForResponse());
    final checkIn = await _checkInRepository.checkIn(lobbyId: lobbyCheckIn.id);
    checkIn.fold((l) {
      emit(CheckInDialogState.error(exception: l));
    }, (r) {
      print('checkin success $r');
      emit(CheckInDialogState.checkInSuccess(checkInTime: r));
    });
  }

  void emitCheckingSuccess(DateTime dateTime) => emit(
        CheckInDialogState.checkInSuccess(checkInTime: dateTime),
      );

  /// Checks if the lobby has already closed/started and leaves in such case.
  Future<void> updateRemoteState() async {
    emit(const CheckInDialogState.waitingForResponse());

    final checkIn = await _checkInRepository.get(lobbyId: lobbyCheckIn.id);

    checkIn.fold((l) {}, (lobby) {
      final hasMatchStarted = lobby.matchId != null;
      final haveOpponentsCheckedIn = lobby.user1CheckIn != null && lobby.user2CheckIn != null;

      if (hasMatchStarted || haveOpponentsCheckedIn) {
        emit(const CheckInDialogState.leaveSuccess(reason: 'Match already started'));
      }
    });
  }
}
