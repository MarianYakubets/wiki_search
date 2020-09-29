part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();
}

class AppStartedEvent extends ConnectivityEvent {
  @override
  String toString() => 'AppStartedEvent';

  @override
  List<Object> get props => [];
}

class OnlineEvent extends ConnectivityEvent {
  @override
  String toString() => 'NetworkOnline';

  @override
  List<Object> get props => [];
}

class OfflineEvent extends ConnectivityEvent {
  @override
  String toString() => 'NetworkOnline';

  @override
  List<Object> get props => [];
}
