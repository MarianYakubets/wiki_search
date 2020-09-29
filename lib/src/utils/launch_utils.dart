import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUtils {
  static openWeb(BuildContext context, String site) async {
    var url = "$site";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return WebviewScaffold(
            url: site,
            appBar: new AppBar(
              title: new Text("Wiki page"),
            ));
      }));
    }
  }
}
