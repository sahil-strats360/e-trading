import 'package:dio/dio.dart';
import 'package:mymoney/constant.dart';

import '../../utils/sequre_storage.dart';

class WatchListRepo {

  // Future<dynamic> marketWatchlist(String userid) async {
  //   var response = await Dio()
  //       .get("$BASE_URL/api/maketwatchlist",
  //           queryParameters: {"user_id": userid},
  //           options: Options(headers: {
  //             'Content-Type': 'application/json',
  //             'Accept': 'application/json',
  //             'Authorization':
  //                 'Bearer $Token',
  //           }));
  //   return response;
  // }



  Future<dynamic> marketWatch(String id) async {
    var response = await DIO.get(
      "$BASE_URL/api/maketwatchlist",
      queryParameters: {"user_id": id},
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

  Future<dynamic> loadWatchList(int id) async {
    print("$id...............");
    var response = await DIO.get(
      "$BASE_URL/api/watchlist",
      queryParameters: {
        "marketwatch_id": id,
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

  Future<dynamic> deletWatchList( String id) async {
    var response = await DIO.post("$BASE_URL/api/deletewatchlist",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
          headers: {
            'Authorization': 'Bearer $Token',
          },
        ),
        data: {"id": id});
    return response;
  }

}
