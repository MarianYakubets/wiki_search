import 'package:flutter/material.dart';

class ViewUtils {


  static showInfoSnackBar(String msg, BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(msg), Icon(Icons.done)],
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
  }

  static showErrorSnackBar(String msg, BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(msg), Icon(Icons.error)],
          ),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
  }

  static showProgressSnackBar(String msg, BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: Duration(hours: 1),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(msg), CircularProgressIndicator()],
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
  }
}
