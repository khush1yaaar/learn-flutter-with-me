import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/BLoC/FormValidation(Ep-3)/blocs/sign_in_bloc.dart';
import 'package:socials/BLoC/FormValidation(Ep-3)/blocs/sign_in_event.dart';
import 'package:socials/BLoC/FormValidation(Ep-3)/blocs/sign_in_state.dart';

class SignInWithEmailScreen extends StatefulWidget {
  const SignInWithEmailScreen({super.key});

  @override
  State<SignInWithEmailScreen> createState() => _SignInWithEmailScreenState();
}

class _SignInWithEmailScreenState extends State<SignInWithEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              TextField(
                controller: email,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context)
                      .add(SignInTextChangedEvent(email!.text, password!.text));
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20), // Space between fields
              TextField(
                controller: password,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context)
                      .add(SignInTextChangedEvent(email!.text, password!.text));
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20), // Space between fields
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is SignInValidState) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedEvent(email!.text, password!.text));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, // Button color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
