import 'dart:developer';

import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/dialogs.dart';
import 'package:fifa/src/common/services/dialog_cubit/dialog_cubit.dart';
import 'package:fifa/src/features/play_match/lobby/check_in_dialog/check_in_dialog.dart';
import 'package:fifa/src/features/play_match/lobby/check_in_dialog/check_in_dialog_cubit.dart';
import 'package:fifa/src/features/play_match/match/dispute/dispute_dialogs.dart';
import 'package:flutter/material.dart';

Future<void> dialogStateListener(BuildContext context, DialogState state, AppLifecycleState appLifecycleState) async {
  if (appLifecycleState == AppLifecycleState.resumed && state is DisplayDialog) {
    try {
      if (state.dialog is CheckInDialog) {
            final dialogState = state.dialog as CheckInDialog;

            log('Will display dialog ${dialogState.lobbyCheckIn}');
            final stopwatch = Stopwatch()..start();
            final dialogResult = await showCheckInDialog<CheckInDialogState>(context, lobbyCheckIn: dialogState.lobbyCheckIn);
            log('User took ${stopwatch.elapsed} to check in to a match $dialogResult');
          } else if (state.dialog is DisputeDialog) {
            final dialogState = state.dialog as DisputeDialog;
            final stopwatch = Stopwatch()..start();

            final dialogResult = await showDialogSlideFromTop(
              context: context,
              dismissOnTap: true,
              child: Material(
                child: DisputeNotificationDialog(
                  matchLobbyData: dialogState.matchLobbyData,
                  results: dialogState.results,
                ),
              ),
            );
            log('User took ${stopwatch.elapsed} to check in to a match $dialogResult');
      } else {
            throw Exception('Unsupported dialog type ${state.dialog.runtimeType} ');
          }
    } catch (e) {
      print(e);
    } finally {
      getIt<DialogCubit>().dialogEnded();

    }
  }
}
