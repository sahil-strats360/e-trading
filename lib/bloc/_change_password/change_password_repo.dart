import 'package:dio/dio.dart';
import 'package:mymoney/constant.dart';

import '../../utils/sequre_storage.dart';

class ChangePasswordRepo {
  Future<dynamic> changePassword(
      String old_password, String new_password, String confrim_password) async {
    print(old_password);
    print(new_password);
    print(confrim_password);
    var response = await DIO.post(
      "$BASE_URL/api/changepassword",
      data: {
        "old_password": old_password,
        "password": new_password,
        "confirm_password": confrim_password
      },
      options: Options(
        // followRedirects: false,
        // validateStatus: (status) {
        //   return status < 500;
        // },
        headers: {
          'Authorization': 'Bearer $Token',
        },
      ),
    );
    return response;
  }
}
