import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthCodeSentState extends AuthState {}

class AuthCodeVerifiedState extends AuthState {}

class AuthLoggedInState extends AuthState {
  final User user;
  AuthLoggedInState(this.user);
}

class AuthLoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}
