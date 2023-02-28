import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dialog_state.dart';

class DialogCubit extends Cubit<DialogState> {
  DialogCubit() : super(DialogInitial());

  void showDialog(DialogType dialog) {
    if (state is DialogInitial) {
      emit(DisplayDialog(dialog));
    } else if (state is DisplayDialog) {
      log('Dialog already displaying $dialog');
    }
  }

  void dialogEnded() {
    if (state is DialogInitial) {
      log('Dialog ended called when no dialogs are being displayed');
    } else if (state is DisplayDialog) {
      emit(DialogInitial());
    }
  }
}
