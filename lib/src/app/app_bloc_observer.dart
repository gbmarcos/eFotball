import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (bloc is! AsyncCubit) {
      log('onChange(${bloc.runtimeType}, $change)', name: '${bloc.runtimeType}');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('Error(${bloc.state})', name: '${bloc.runtimeType}', error: error, stackTrace: stackTrace,);

    super.onError(bloc, error, stackTrace);
  }
}
