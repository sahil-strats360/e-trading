abstract class AccountState {}

class Init extends AccountState {}

class Submitting extends AccountState {}

class Submited extends AccountState {}

class Failed extends AccountState {
  String msg;

  Failed(this.msg);
}