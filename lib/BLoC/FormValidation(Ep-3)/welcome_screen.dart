import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/BLoC/FormValidation(Ep-3)/blocs/sign_in_bloc.dart';
import 'package:socials/BLoC/FormValidation(Ep-3)/blocs/sign_in_state.dart';
import 'package:socials/BLoC/FormValidation(Ep-3)/sign_in_with_email_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.blue, // Blue color for app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Our App!",
              style: TextStyle(
                fontSize: 24, // Increased font size for the welcome text
                fontWeight: FontWeight.bold, // Bold text style
                color: Colors.blueAccent, // Blue color for the text
              ),
            ),
            const SizedBox(height: 20), // Space between the text and button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => SignInBloc(SignInInitialState()),
                              child: const SignInWithEmailScreen(),
                            )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // Padding for button
                textStyle: const TextStyle(
                  fontSize: 18, // Font size for button text
                ),
              ),
              child: const Text(
                'Sign in with Email',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
