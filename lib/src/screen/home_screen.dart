import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_search/src/bloc/connectivity/connectivity_bloc.dart';
import 'package:wiki_search/src/screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(builder: (context, state) {
        if (state is OnlineState) return SearchScreen();
        return Center(
          child: Text(tr('offline_msg')),
        );
      }),
    ));
  }
}
