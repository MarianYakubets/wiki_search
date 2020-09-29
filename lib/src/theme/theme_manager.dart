import 'package:flutter/material.dart';

class ThemeManager {
  static final mainTheme = ThemeData(
      primaryColor: Color(0xff525252),
      disabledColor: Color(0xff979797),
      accentColor: Color(0xffda4302),
      errorColor: Color(0xffc70d3a),
      backgroundColor: Color(0xff414141),
      splashColor: Color(0xFFe0e0e0),
      textTheme:
          TextTheme(button: TextStyle(fontSize: 18.0, color: Colors.white)));
}
