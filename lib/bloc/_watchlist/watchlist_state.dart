import '../../model/marketwatch_model.dart';
import '../../model/watchlist_model.dart';

abstract class WatchListState {}

class Init extends WatchListState {}

class Loading extends WatchListState {}

class Loaded extends WatchListState {
  List<MarketWatchListModel> marketList;
  Loaded(this.marketList);
}

// class Loaded extends WatchListState {
//  List <WatchListModel> watchList;
//   Loaded(this.watchList);
// }

class LoadedWatchWatchList extends Loaded {
  List<WatchListModel> watchList;
  LoadedWatchWatchList(List<MarketWatchListModel> marketList, this.watchList)
      : super(marketList);
  // List<MarketWatchListModel> marketlist;
}
class Deleted extends LoadedWatchWatchList {
  String msg;

  Deleted(List<MarketWatchListModel> marketList, List<WatchListModel> watchList) : super(marketList, watchList);

}

class Failed extends WatchListState {
  String msg;
  Failed(this.msg);
}
