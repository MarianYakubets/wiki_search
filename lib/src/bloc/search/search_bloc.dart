import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:wiki_search/src/model/wiki_page.dart';
import 'package:wiki_search/src/repository/search_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc(this.repository) : super(EmptySearchState(""));

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is ClearSearch) yield EmptySearchState("");
    if (event is PerformSearch) yield* performSearch(event.input);
  }

  Stream<SearchState> performSearch(String input) async* {
    yield LoadingSearchState(input);
    if (input.isEmpty) {
      yield EmptySearchState("");
    } else {
      try {
        var list = await repository.search(input);
        if (list.isEmpty) {
          yield ErrorSearchState(input, msg: tr('failed_msg'));
          yield EmptySearchState("");
        } else
          yield ResultSearchState(input, pages: list);
      } catch (msg) {
        yield ErrorSearchState(input, msg: tr('failed_msg'));
        yield EmptySearchState("");
      }
    }
  }
}
