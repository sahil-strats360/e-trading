import 'package:dio/dio.dart';

import '../../constant.dart';
import '../../utils/sequre_storage.dart';
class BuySellRepo {
  Future<dynamic> stockBuySell( String qty, String order_type,
      String marketWatchlist_name, String marketWatchSymbol, String entry_type,
      String price) async {
    print("$entry_type.........entry......");
    // print("$qty...............");
    print("$order_type...............");
    print("$marketWatchlist_name...............");
    print("$marketWatchSymbol...............");
    print("$price...............");




    var response = await DIO.post(
      "$BASE_URL/api/buysellorder",
      data: {
        "marketwatchlist_name": marketWatchlist_name,
        "quantity": qty,
        "price": price,
        "order_type": order_type,
        "marketwatch_symbol": marketWatchSymbol,
        "entry_type": entry_type,
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
}