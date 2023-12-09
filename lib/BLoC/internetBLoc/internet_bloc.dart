import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:diet_app/BLoC/internetBLoc/internet_event.dart';
import 'package:diet_app/BLoC/internetBLoc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectiviSubsripation;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    connectiviSubsripation =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else if (result == ConnectivityResult.none) {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectiviSubsripation?.cancel();
    return super.close();
  }
}
