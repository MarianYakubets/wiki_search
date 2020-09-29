part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class PerformSearch extends SearchEvent {
  final String input;

  PerformSearch({this.input});

  @override
  String toString() => 'AppStartedEvent';

  @override
  List<Object> get props => [input];
}

class ClearSearch extends SearchEvent {

  ClearSearch();

  @override
  String toString() => 'ClearSearch';

  @override
  List<Object> get props => [];
}
