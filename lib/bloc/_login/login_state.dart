abstract class LoginState {}

class Init extends LoginState {}

class Submiting extends LoginState {}

class Submited extends LoginState {}

class Failed extends LoginState {
  String msg;
  Failed(this.msg);
}
