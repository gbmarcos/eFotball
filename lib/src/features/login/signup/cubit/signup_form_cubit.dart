import 'package:fifa/r.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/login/signup/cubit/signup_state.dart';
import 'package:fifa/src/features/login/signup/models/signup_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupFormCubit extends Cubit<SignupState> {
  SignupFormCubit()
      : super(
          SignupState(
            model: SignupModel(),
            formDate: R.dateSpecifications.maxDateOfBirthAllowed,
          ),
        );

  void changeDate(DateTime newDate) {
    emit(state.copyWith(formDate: newDate));
  }

  void updateState(SignupState newState) {
    emit(newState);
  }

  void changeSelectedGameConsole(Console newConsole) {
    if (newConsole != state.selectedConsole) {
      emit(state.copyWith(selectedConsole: newConsole));
    }
  }

  void toggleTermsAccepted([bool? accepted]) {
    emit(state.copyWith(areTermsAccepted: accepted ?? !state.areTermsAccepted));
  }
}
