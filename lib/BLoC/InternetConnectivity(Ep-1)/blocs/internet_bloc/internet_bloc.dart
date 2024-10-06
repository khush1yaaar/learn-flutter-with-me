import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/BLoC/InternetConnectivity(Ep-1)/blocs/internet_bloc/internet_event.dart';
import 'package:socials/BLoC/InternetConnectivity(Ep-1)/blocs/internet_bloc/internet_state.dart';

// InternetBloc manages the internet connectivity state using BLoC pattern.
class InternetBloc extends Bloc<InternetEvent, InternetState> {
  // Connectivity instance to check the network status.
  final Connectivity _connectivity = Connectivity();
  // Subscription to listen for connectivity changes.
  StreamSubscription? connectivitySubscription;

  // Constructor: Initializes the Bloc with an initial state and sets up event handlers.
  InternetBloc() : super(InternetInitialState()) {
    // Handles the InternetLostEvent by emitting an InternetLostState.
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    
    // Handles the InternetGainEvent by emitting an InternetGainState.
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));

    // Listen for changes in connectivity status.
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) async {
      // Check for actual internet access
      bool hasInternet = await _hasInternetConnection();
      
      // Emit event based on internet access
      if (hasInternet) {
        add(InternetGainEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  // Function to check actual internet access
  Future<bool> _hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  // Override the close method to cancel the subscription when the Bloc is disposed.
  @override
  Future<void> close() {
    // Cancel the connectivity subscription to prevent memory leaks.
    connectivitySubscription?.cancel();
    return super.close();
  }
}
