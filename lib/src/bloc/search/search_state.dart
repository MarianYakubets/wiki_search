part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  final String input;

  SearchState(this.input);
}

class EmptySearchState extends SearchState {
  EmptySearchState(String input) : super(input);

  @override
  String toString() => 'EmptySearchState';

  @override
  List<Object> get props => [];
}

class LoadingSearchState extends SearchState {
  LoadingSearchState(String input) : super(input);

  @override
  String toString() => 'EmptySearchState';

  @override
  List<Object> get props => [];
}

class ErrorSearchState extends SearchState {
  final String msg;

  ErrorSearchState(String input, {this.msg}) : super(input);

  @override
  String toString() => 'EmptySearchState';

  @override
  List<Object> get props => [msg];
}

class ResultSearchState extends SearchState {
  final List<WikiPage> pages;

  ResultSearchState(String input, {this.pages}) : super(input);

  @override
  String toString() => 'EmptySearchState';

  @override
  List<Object> get props => [pages];
}
