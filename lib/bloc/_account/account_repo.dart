import 'package:dio/dio.dart';

import '../../constant.dart';
import '../../utils/sequre_storage.dart';
// DIO.options.headers;['content-Type'] = 'application/json';
// DIO.options.headers;["authorization"] = "token ${token}";

class AccountRepo {
  Future<dynamic> updateProfileApi(
    String username,
  ) async {
    print(username);

    FormData formData = FormData.fromMap({"name": username});

    var response = await DIO.post(
      "$BASE_URL/api/updatuser",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        headers: {
          'Authorization': 'Bearer $Token',
        },
      ),
      data: formData,
    );
    return response;
  }

  Future<dynamic> logoutApi() async {
    var response = await DIO.post(
      "$BASE_URL/api/logout",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        headers: {
          'Authorization': 'Bearer $Token',
        },
      ),
    );
    print('Token : ${Token}');
    return response;
  }
}
