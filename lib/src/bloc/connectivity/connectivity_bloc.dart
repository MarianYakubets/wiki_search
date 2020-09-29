import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:wiki_search/src/utils/network_utils.dart';

part 'connectivity_event.dart';

part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  var subscription;

  ConnectivityBloc() : super(OfflineState());

  @override
  Stream<ConnectivityState> mapEventToState(
    ConnectivityEvent event,
  ) async* {
    if (event is AppStartedEvent) yield* _startApp();
    if (event is OfflineEvent) yield OfflineState();
    if (event is OnlineEvent) yield OnlineState();
  }

  Stream<ConnectivityState> _startApp() async* {
    _startNetworkListener();
    yield OfflineState();
    if (await NetworkUtils.isOnline()) yield OnlineState();
  }

  _startNetworkListener() {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none)
        add(OfflineEvent());
      else
        add(OnlineEvent());
    });
  }

  @override
  Future<Function> close() {
    subscription.cancel();
    return super.close();
  }
}
