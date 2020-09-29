import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_search/src/app.dart';
import 'package:wiki_search/src/bloc/connectivity/connectivity_bloc.dart';
import 'package:wiki_search/src/repository/search_repository.dart';

void main() {
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SearchRepository>(
          create: (context) => SearchRepository(),
        )
      ],
      child: MultiBlocProvider(
          providers: [BlocProvider<ConnectivityBloc>(create: (context) => ConnectivityBloc()..add(AppStartedEvent()))],
          child: EasyLocalization(
              supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
              path: 'assets/translations',
              fallbackLocale: Locale('en', 'US'),
              child: App()))));
}
