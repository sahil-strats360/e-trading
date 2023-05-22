import '../../model/searchlist_model.dart';
import '../../model/watchlist_model.dart';

abstract class SearchListState {}

class Init extends SearchListState {}

class Loading extends SearchListState {}

class Loaded extends SearchListState {
  List<SearchListModel> searchList;
  Loaded(this.searchList);
}

class Added extends SearchListState {
  String message;

  Added(this.message);
}

class Failed extends SearchListState {
  String msg;
  Failed(this.msg);
}

class AddScriptState {
  WatchListModel model;

  AddScriptState(this.model);
}
