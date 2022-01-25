import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:need_doctors/models/StaticData/UserfulLinks/UseFulLink.dart';

class UsefulLinkWebView extends StatelessWidget {
  const UsefulLinkWebView({this.usefulLink, Key key}) : super(key: key);

  final UsefulLink usefulLink;

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: usefulLink.link,
      appBar: AppBar(title: Text(usefulLink.title)),
      initialChild: Container(
        child: const Center(
          child: Text('Loading.....'),
        ),
      ),
    );
  }
}
