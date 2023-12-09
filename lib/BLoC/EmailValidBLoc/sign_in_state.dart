abstract class SignInState {}

class SignInValidState extends SignInState {}

class SignInInitState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errormessege;
  SignInErrorState(this.errormessege);
}

class SignInLodingState extends SignInState {}
