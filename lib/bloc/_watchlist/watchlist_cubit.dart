import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymoney/bloc/_watchlist/watchlist_repo.dart';
import 'package:mymoney/bloc/_watchlist/watchlist_state.dart';
import 'package:mymoney/model/watchlist_model.dart';

import '../../constant.dart';
import '../../model/marketwatch_model.dart';
import '../../utils/sequre_storage.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(Init());
  WatchListRepo repo = WatchListRepo();

  void loadMarketwatch(String userid,int index) {
    // emit(Loading());
    // print(id);
    repo.marketWatch(userid).then((response) {
                 print("selected index...............$index");

      List<MarketWatchListModel> list =
          response.data["user"].map<MarketWatchListModel>((json) {
        print(response);
            // print(response.data["user"]['index']["market_watch_name"].toString());

            return MarketWatchListModel.fromJson(json);
      }).toList();
      emit(Loaded(list));
      print((response.data["user"][0]["id"]));
      loadWatchList((response.data["user"][index]["id"]));
    }).catchError((e) {
      print(e);
    });
  }

  void loadWatchList(int id) {
    repo.loadWatchList(id).then((response) {
      print(response);
      List<WatchListModel> list =
          response.data["watchlist"].map<WatchListModel>((json) {
        return WatchListModel.fromJson(json);
      }).toList();
      emit(LoadedWatchWatchList((state as Loaded).marketList, list));
    }).catchError((value) {
      print(value);
      DioError error = value;
      if (error.response != null) {
        if (error.response.statusCode == 401 ||
            error.response.statusCode == 403) {
          deletToken();
          emit(Failed(UNAUTHENTICATED));
        }
        try {
          emit(Failed(error.response.data));
        } catch (e) {
          emit(Failed(error.response.data['detail']));
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


  void deletTowatchList(String id) async {
    repo.deletWatchList(id).then((response) {
      // emit(Deleted(response.data['message']));
      emit(Deleted(((state as Loaded).marketList), ((state as LoadedWatchWatchList).watchList)));
      // emit(LoadedWatchWatchList((state as Loaded).marketList, ((state as LoadedWatchWatchList).watchList)));
      print(response);
    }).catchError((e) {
      print(e);
    });
  }
}
