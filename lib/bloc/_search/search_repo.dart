import 'package:dio/dio.dart';
import 'package:mymoney/constant.dart';

import '../../utils/sequre_storage.dart';

class SearchListRepo {
  Future<dynamic> loadSearchList(String name,) async {
    print("$name...............");
    var response = await DIO.get(
      "$BASE_URL/api/getscript",
      queryParameters: {
        "name": name,
        "limit" : 8
      },
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


  Future<dynamic> addScript(String scriptId, int marketwatchListid) async {
    var response = await DIO.post("$BASE_URL/api/addsriptmaketwatch",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
          headers: {
            'Authorization': 'Bearer $Token',
          },
        ),
        data: {"scrip_id": scriptId, "marketwatch_id": marketwatchListid});
    return response;
  }
}
