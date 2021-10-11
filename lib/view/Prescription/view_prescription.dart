import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ViewPrescription extends StatelessWidget {
  const ViewPrescription({Key key, this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    final Set<JavascriptChannel> jsChannels = [
      JavascriptChannel(
          name: 'Print',
          onMessageReceived: (JavascriptMessage message) {
            print(message.message);
          }),
    ].toSet();
    return WebviewScaffold(
      url: url,
      javascriptChannels: jsChannels,
      appBar: new AppBar(
        title: const Text('View Prescription'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child: const Center(
          child: Text('Loading.....'),
        ),
      ),
    );
  }
}
