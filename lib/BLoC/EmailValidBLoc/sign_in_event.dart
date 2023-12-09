abstract class SignInEvent {}

class SignInChangeEvent extends SignInEvent {
  final String emailvalid;
  final String passwordvalid;
  SignInChangeEvent(this.emailvalid, this.passwordvalid);
}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmitEvent(this.email, this.password);
}
