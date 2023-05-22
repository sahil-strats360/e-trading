import 'package:dio/dio.dart';

import '../../constant.dart';
import '../../utils/sequre_storage.dart';

class  AuthRepo {
   Future<dynamic> userdetailsApi() async {
    var response = await DIO.get(
      "$BASE_URL/api/getuser",
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
    return response;
  }
}