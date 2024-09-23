import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/BLoC/blocs/internet_bloc/internet_event.dart';
import 'package:socials/BLoC/blocs/internet_bloc/internet_state.dart';

// InternetBloc manages the internet connectivity state using BLoC pattern.
class InternetBloc extends Bloc<InternetEvent, InternetState> {
  // Connectivity instance to check the network status.
  Connectivity _connectivity = Connectivity();
  // Subscription to listen for connectivity changes.
  StreamSubscription? connectivitySubscription;

  // Constructor: Initializes the Bloc with an initial state and sets up event handlers.
  InternetBloc() : super(InternetInitialState()) {
    // Handles the InternetLostEvent by emitting an InternetLostState.
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    
    // Handles the InternetGainEvent by emitting an InternetGainState.
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));

    // Listen for changes in connectivity status.
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      // If connected to mobile or WiFi, add an InternetGainEvent.
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        // If disconnected, add an InternetLostEvent.
        add(InternetLostEvent());
      }
    });
  }

  // Override the close method to cancel the subscription when the Bloc is disposed.
  @override
  Future<void> close() {
    // Cancel the connectivity subscription to prevent memory leaks.
    connectivitySubscription?.cancel();
    return super.close();
  }
}
