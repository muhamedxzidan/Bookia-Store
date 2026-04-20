import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:bookia_store/features/search/data/repo_search.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Timer? _debounce;
  int _requestId = 0;

  void onQueryChanged(String query) {
    _debounce?.cancel();
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      _requestId++;
      emit(SearchInitial());
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _search(trimmed);
    });
  }

  Future<void> _search(String keyword) async {
    final requestId = ++_requestId;
    emit(SearchLoading());
    final results = await RepoSearch.search(keyword);
    if (requestId != _requestId) return;
    if (results == null) {
      emit(SearchError(message: 'Failed to search. Please try again.'));
      return;
    }
    if (results.isEmpty) {
      emit(SearchEmpty(keyword: keyword));
      return;
    }
    emit(SearchLoaded(results: results));
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}