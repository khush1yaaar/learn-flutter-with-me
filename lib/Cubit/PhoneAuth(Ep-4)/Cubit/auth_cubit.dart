import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/Cubit/PhoneAuth(Ep-4)/Cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState());

  String? _verificationID;

  void sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      verificationCompleted: (PhoneAuthCredential) {
        signInWithPhoneNumber(PhoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(AuthErrorState(error.message.toString()));
      },
      codeSent: (verificationID, forceResendingToken) {
        _verificationID = verificationID;
        emit(AuthCodeSentState());
      },
      codeAutoRetrievalTimeout: (verificationID) {
        _verificationID = verificationID;
      },
    );
  }

  void verifyOTP(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationID!, smsCode: otp);
    signInWithPhoneNumber(credential);
  }

  void signInWithPhoneNumber(PhoneAuthCredential credential) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message.toString()));
    }
  }
}
