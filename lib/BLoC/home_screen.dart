import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/BLoC/blocs/internet_bloc/internet_bloc.dart';
import 'package:socials/BLoC/blocs/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // if you only want to check the state in the background and don't wanna change the UI use BlocListner 
          // if you only want to change the UI use BlocBuilder, not the background process 

          // if you want to do both things simultaneously use - BlocConsumer combines BlocListener and BlocBuilder
          child: BlocConsumer<InternetBloc, InternetState>(
            // if you only want to check the state in the background and don't wanna change the UI use BlocListner 
            // Listener: Responds to changes in state
            listener: (context, state) {
              // Check if the state is InternetGainState (connected to the internet)
              if (state is InternetGainState) {
                // Show a SnackBar to inform the user they are online
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('you are online'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                // For any other state, show SnackBar indicating offline status
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('you are offline'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            // Builder: Builds the UI based on the current state
            builder: (context, state) {
              // Check if the state is InternetInitialState (loading state)
              if (state is InternetInitialState) {
                // Show loading text while checking internet status
                return const Text('LOADING...');
              } else if (state is InternetGainState) {
                // Show text indicating internet is connected
                return const Text('INTERNET CONNECTED');
              } else {
                // For any other state (e.g., disconnected), show offline message
                return const Text('INTERNET NOT CONNECTED');
              }
            },
          ),
        ),
      ),
    );
  }
}
