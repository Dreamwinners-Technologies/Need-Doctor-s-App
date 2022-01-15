// ignore_for_file: non_constant_identifier_names
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:file_utils/file_utils.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class ViewPrescription extends StatefulWidget {
  const ViewPrescription({Key key, this.url}) : super(key: key);
  final String url;

  @override
  State<ViewPrescription> createState() => _ViewPrescriptionState();
}

class _ViewPrescriptionState extends State<ViewPrescription> {
  // final pdfUrl =
  //     "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";

  bool downloading = false;
  var progress = "";
  var path = "No Data";
  var platformVersion = "Unknown";
  var _onPressed;
  Directory externalDir;

  @override
  void initState() {
    super.initState();
    downloadFile();
  }

  String convertCurrentDateTimeToString() {
    String formattedDateTime = DateFormat('yyyyMMdd_kkmmss').format(DateTime.now()).toString();
    return formattedDateTime;
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    final status = await Permission.storage.request();
    if (status.isGranted) {
      String dirloc = "";
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }

      try {
        FileUtils.mkdir([dirloc]);
        await dio.download(widget.url + '.pdf', dirloc + convertCurrentDateTimeToString() + ".pdf",
            onReceiveProgress: (receivedBytes, totalBytes) {
          print('here 1');
          setState(() {
            downloading = true;
            progress = ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
            print(progress);
          });
          print('here 2');
        });
      } catch (e) {
        print('catch catch catch');
        print(e);
      }

      setState(() {
        downloading = false;
        progress = "Download Completed.";
        path = dirloc + convertCurrentDateTimeToString() + ".pdf";
      });
      print(path);
      print('here give alert-->completed');
    } else {
      setState(() {
        progress = "Permission Denied!";
        _onPressed = () {
          downloadFile();
        };
      });
    }
  }

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
        url: widget.url,
        javascriptChannels: jsChannels,
        appBar: new AppBar(
          title: const Text('View Prescription'),
          actions: [
            IconButton(
              onPressed: () async {
                downloadFile();

                // screenshotController.capture(delay: Duration(milliseconds: 10)).then(
                //   (capturedImage) async {
                //     ShowCapturedWidget(context, capturedImage);
                //   },
                // ).catchError(
                //   (onError) {
                //     print(onError);
                //   },
                // );
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
