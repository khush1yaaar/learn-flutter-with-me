import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/Cubit/PhoneAuth(Ep-4)/Cubit/auth_cubit.dart';
import 'package:socials/Cubit/PhoneAuth(Ep-4)/Cubit/auth_state.dart';
import 'package:socials/Cubit/PhoneAuth(Ep-4)/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoggedOutState) {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).signOut();
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                backgroundColor: Colors.blue, // Slightly transparent button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
