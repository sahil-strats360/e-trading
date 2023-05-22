import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_password_repo.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(Init());
  ChangePasswordRepo repo = ChangePasswordRepo();
  Future<void> changePassword(
      String old_password, String new_password, String confrim_password) async {
    emit(Submiting());
    try {
      var response = await repo.changePassword(
          old_password, new_password, confrim_password);
      if (response.data["message"] ==
          "Your password has been changed successfully!") {
        emit(Submited(response.data["message"]));
      }
        print(response.data["message"]);

      if (response.data["status"] == false) {
        print(response.data["message"]);
        emit(Failed(response.data["message"]));
        print(state);
      }
    } catch (e) {
      DioError error = e as DioError;
      print(error);
      if (error.response != null) {
        if (error.response.statusCode == 400) {
          try {
            emit(Failed(error.response.data));
          } catch (e) {
            emit(Failed(error.response.data['message']));
            print("hi");
          }
        }
        if (error.response.statusCode == 406) {
          try {
            emit(Failed(error.response.data));
          } catch (e) {
            emit(Failed(error.response.data['message']));
          }
        }
        if (error.response.statusCode == 422) {
          try {
            emit(Failed(error.response.data));
          } catch (e) {
            emit(Failed(error.response.data['message']));
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
  // void changePassword(
  //     String old_password, String new_password, String confrim_password) {
  //   print(old_password);
  //   emit(Submitting());
  //   repo
  //       .changePassword(old_password, new_password, confrim_password)
  //       .then((response) {
  //     if (response.data["message"] ==
  //         "Your password has been changed successfully!") {
  //       emit(Submitted());
  //     }
  //      if (response.data["status"] ==false) {
  //       print(response.data["message"]);
  //       emit(Failed(response.data["message"]));
  //     }
  //   }).catchError((value) {
  //     print(value);
  //     DioError error = value;
  //     print("err");
  //     if (error.response != null) {
  //       print("object");
  //       if (error.response.statusCode == 400) {
  //         try {
  //           emit(Failed(error.response.data));
  //         } catch (e) {
  //           emit(Failed(error.response.data['message']));
  //         }
  //       }
  //       if (error.response.statusCode == 406) {
  //         try {
  //           emit(Failed(error.response.data));
  //         } catch (e) {
  //           emit(Failed(error.response.data['message']));
  //         }
  //       }
  //       if (error.response.statusCode == 422) {
  //         try {
  //           emit(Failed(error.response.data));
  //         } catch (e) {
  //           emit(Failed(error.response.data['message']));
  //         }
  //       }
  //     } else {
  //       if (error.type == DioErrorType.unknown) {
  //         emit(Failed("Please check your internt connection"));
  //       } else {
  //         emit(Failed(error.message));
  //       }
  //     }
  //   });
  // }
}
