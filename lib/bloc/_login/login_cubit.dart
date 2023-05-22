import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymoney/bloc/_login/login_state.dart';

import '../../utils/sequre_storage.dart';
import 'login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(Init());
  LoginRepo repo = LoginRepo();

  void login(String email, String password) {
    emit(Submiting());
    repo.loginApi(email, password).then((response) {
      print(response.data["user"]['id']);
      print(response.data["access_token"]);
      String token = response.data['access_token'];
      // print(response.data);
      storeToken(token).then((value) {
        emit(Submited());
        // print(token);
      });
    }).catchError((value) {
      print(value);
      DioError error = value;
      print("err");
      if (error.response != null) {
        print("object");
        if (error.response.statusCode == 401) {
          try {
            emit(Failed(error.response.data));
          } catch (e) {
            emit(Failed(error.response.data['error']));
          }
        }
      } else {
        if (error.type == DioErrorType.unknown) {
          emit(Failed("Please check your internt connection"));
        } else {
          emit(Failed(error.message));
        }
      }
    });
  }
}
