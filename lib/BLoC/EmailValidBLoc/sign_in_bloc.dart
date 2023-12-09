import 'package:diet_app/BLoC/EmailValidBLoc/sign_in_event.dart';
import 'package:diet_app/BLoC/EmailValidBLoc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitState()) {
    on<SignInChangeEvent>(
      (event, emit) {
        if (event.emailvalid == '' ||
            EmailValidator.validate(event.emailvalid) == false) {
          emit(
            SignInErrorState(
              'Please Enter valid Email ',
            ),
          );
        } else if (event.passwordvalid.length <= 8) {
          emit(SignInErrorState('Please Enter Valid Password'));
        } else {
          emit(SignInValidState());
        }
      },
    );
    on<SignInSubmitEvent>(
      (event, emit) {
        emit(SignInLodingState());
      },
    );
  }
}
