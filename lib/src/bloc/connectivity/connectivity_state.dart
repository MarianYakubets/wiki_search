part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
}

class OfflineState extends ConnectivityState {
  const OfflineState();

  @override
  String toString() => 'OfflineState';

  @override
  List<Object> get props => [];
}

class OnlineState extends ConnectivityState {
  const OnlineState();

  @override
  String toString() => 'OnlineState';

  @override
  List<Object> get props => [];
}
