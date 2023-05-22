import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymoney/bloc/_search/search_repo.dart';
import 'package:mymoney/bloc/_search/search_state.dart';
import 'package:mymoney/model/searchlist_model.dart';

import '../../constant.dart';
import '../../utils/sequre_storage.dart';

class SearchListCubit extends Cubit<SearchListState> {
  SearchListCubit() : super(Init());
  SearchListRepo repo = SearchListRepo();
  void loadsearchList(String search) {
    print(search);
    emit(Loading());
    repo.loadSearchList(search).then((response) {
      print(response);
      List<SearchListModel> list =
          response.data["script"].map<SearchListModel>((json) {
        return SearchListModel.fromJson(json);
      }).toList();
      emit(Loaded(list));
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

  void addTowatchList(String scriptId, int marketwatch_id) async {
    repo.addScript(scriptId, marketwatch_id).then((response) {
      emit(Added(response.data['message']));
      print(response);
    }).catchError((e) {
      print(e);
    });
  }
}
