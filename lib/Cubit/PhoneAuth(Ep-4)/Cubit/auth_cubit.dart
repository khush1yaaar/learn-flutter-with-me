import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/Cubit/PhoneAuth(Ep-4)/Cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState());

  void sendOTP(String phoneNumber) async {
    await _auth.
  }

  void verifyOTP(String otp) async {}

  void signInWithPhoneNumber() async {}
  
}
