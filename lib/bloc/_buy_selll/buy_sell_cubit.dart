import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymoney/bloc/_buy_selll/buy_sell_state.dart';

import 'buy_sell_repo.dart';

class BuySellCubit extends Cubit<BuySellState>{
  BuySellCubit() : super(Init());

  BuySellRepo repo= BuySellRepo();

  void buySell(String qty,String order_type,String marketWatchlist_name,String marketWatchSymbol,String entry_type,String price){
    emit(Loading());
    repo.stockBuySell(qty, order_type, marketWatchlist_name, marketWatchSymbol, entry_type, price).then((response) {
      print(response);
      emit(Loaded());
    }).catchError((e){
      print(e);
    });


  }

}