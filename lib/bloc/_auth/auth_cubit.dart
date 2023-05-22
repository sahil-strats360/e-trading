import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymoney/bloc/_auth/auth_repo.dart';
import 'package:mymoney/bloc/_auth/auth_state.dart';

import '../../model/user_model.dart';
import '../../utils/sequre_storage.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Init());
  AuthRepo repo = AuthRepo();
  Future<void> loadUserDetails() async {
    try {
      var response = await repo.userdetailsApi();
      print(response);
      emit(Authenticated(User.fromJson(response.data["user"])));
    } catch (e) {
      DioError error = e as DioError;
      print(error);
      print("hi");
      if (error.response != null) {
        if (error.response.statusCode == 401 ||
            error.response.statusCode == 403) {
          // emit(UnAuthenticated());
          deletToken();
        } else {
          try {
            emit(Failed(error.response.data));
          } catch (e) {
            emit(Failed(error.response.data['details']));
          }
        }
      } else {
        if (error.type == DioErrorType.unknown) {
          print("ii");
          emit(Failed("Please check your internate"));
        } else {
          emit(Failed(error.message));
        }
      }
    }
    return;
  }
}
