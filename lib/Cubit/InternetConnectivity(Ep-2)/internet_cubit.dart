import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Lost, Gained }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription connectivitySubscription;

  InternetCubit() : super(InternetState.Initial) {
    // Listen to connectivity changes
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) async {
      bool hasInternet = await _hasInternetConnection();

      if (hasInternet) {
        emit(InternetState.Gained);
      } else {
        emit(InternetState.Lost);
      }
      // if (result == ConnectivityResult.mobile ||
      //     result == ConnectivityResult.wifi ||
      //     result == ConnectivityResult.other) {
      //   emit(InternetState.Gained);
      // } else {
      //   emit(InternetState.Lost);
      // }
    });
  }

  Future<bool> _hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }

  @override
  Future<void> close() async {
    await connectivitySubscription?.cancel(); // Cancel the subscription
    return super.close();
  }
}
