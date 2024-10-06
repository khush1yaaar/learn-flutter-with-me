import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socials/BLoC/FormValidation(Ep-3)/blocs/sign_in_event.dart';
import 'package:socials/BLoC/FormValidation(Ep-3)/blocs/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(super.initialState) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.email == "" && EmailValidator.validate(event.email) == false) {
        emit(SignInErrorState("please entre your email"));
      } else if (event.password.length < 6) {
        emit(SignInErrorState("password must have atleast 6 characters"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
