import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymoney/bloc/_account/account_state.dart';
import 'package:mymoney/model/user_model.dart';
import 'package:mymoney/utils/sequre_storage.dart';

import '../../constant.dart';
import '../_auth/auth_state.dart' as AuthState;
import 'account_repo.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(Init());
  AccountRepo repo = AccountRepo();

  void updateProfile(String username) {
    emit(Submitting());
    repo.updateProfileApi(username).then((response) {
      authcubit
          .emit(AuthState.Authenticated(User.fromJson(response.data["user"])));
      emit(Submited());
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

  void logout() {
    // deletToken();
    emit(Submitting());
    repo.logoutApi().then((response) {
      print(response.data["message"].toString());
      if (response.data["message"].toString() == "Successfully logged out") {
        print("succesfull logOut....");
        deletToken();
        authcubit.emit(AuthState.UnAuthenticated());
        emit(Submited());
      }
    });
    // Logout.authCubit.emit(AuthState.UnAuthenticated());
  }
}
