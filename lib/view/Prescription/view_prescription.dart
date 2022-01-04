// ignore_for_file: non_constant_identifier_names
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:screenshot/screenshot.dart';

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

    ScreenshotController screenshotController = ScreenshotController();

    return Screenshot(
      controller: screenshotController,
      child: WebviewScaffold(
        url: url,
        javascriptChannels: jsChannels,
        appBar: new AppBar(
          title: const Text('View Prescription'),
          actions: [
            IconButton(
              onPressed: () async {

                screenshotController.capture(delay: Duration(milliseconds: 10)).then(
                  (capturedImage) async {
                    ShowCapturedWidget(context, capturedImage);
                  },
                ).catchError(
                  (onError) {
                    print(onError);
                  },
                );
              },
              icon: Icon(
                Icons.face,//download,
                color: whitecolor,
              ),
            ),
          ],
        ),
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Container(
          child: const Center(
            child: Text('Loading.....'),
          ),
        ),
      ),
    );
  }

  Future<dynamic> ShowCapturedWidget(BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text("Click and Download"), actions: [
          IconButton(
              onPressed: () {
                getImage(capturedImage);
              },
              icon: Icon(
                Icons.face,//download,
                color: whitecolor,
              ))
        ]),
        body: Container(),
      ),
    );
  }

  getImage(Uint8List _image) async {
    await [Permission.storage].request();

    final time = DateTime.now().toIso8601String().replaceAll('.', '_').replaceAll(':', '_');
    final title = "prescription_$time";

    final result = await ImageGallerySaver.saveImage(_image, name: title);

    sendToast("Successfully downloaded!");
    return result['filePath'];
  }
}
