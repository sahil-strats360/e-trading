
abstract class ChangePasswordState {}

class Init extends ChangePasswordState {}

class Submiting extends ChangePasswordState {}

class Submited extends ChangePasswordState {
  String msg;
  Submited(this.msg);
}

class Failed extends ChangePasswordState {
  String msg;
  Failed(this.msg);
}
