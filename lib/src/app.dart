import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wiki_search/src/theme/theme_manager.dart';

import 'screen/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeManager.mainTheme,
        home: _buildHomeScreen(context));
  }

  Widget _buildHomeScreen(BuildContext context) {
    return HomeScreen();
  }
}
