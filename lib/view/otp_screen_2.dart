import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/controller/otp_controller.dart';
import 'package:sms_retriever/sms_retriever.dart';

import 'otp/utils/logo.dart';
import 'otp/utils/submitBtn.dart';
import 'otp/utils/textField.dart';

class OtpScreen2 extends StatefulWidget {
  const OtpScreen2(this.phone, {Key key}) : super(key: key);

  final phone;

  @override
  _OtpScreen2State createState() => _OtpScreen2State();
}

class _OtpScreen2State extends State<OtpScreen2> {
  String _smsCode = "";
  bool isListening = false;

  getCode(String sms) {
    if (sms != null) {
      final intRegex = RegExp(r'\d+', multiLine: true);
      final code = intRegex.allMatches(sms).first.group(0);
      return code;
    }
    return "NO SMS";
  }

  @override
  void initState() {
    // TODO: implement initState
    // print(await SmsRetriever.getAppSignature());
    getOtp();
    super.initState();
  }

  void getOtp() async {
    isListening = true;
    setState(() {});
    String smsCode = await SmsRetriever.startListening();
    _smsCode = getCode(smsCode);
    otpController.text = _smsCode;
    isListening = false;
    setState(() {});
    SmsRetriever.stopListening();
  }

  final TextEditingController otpController = TextEditingController();

  // final OtpController otpstateController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: sText("OTP", whitecolor, 20.0, FontWeight.bold),
        ),
        body: new Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                imagset(size.width),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: rText('We just need your', ' OTP', primarycolor, primarylight, 22.0, FontWeight.bold),
                ),
                sText('to verify your account', primarycolor, 22.0, FontWeight.bold),
                // FutureBuilder(
                //   builder: (context, data) {
                //     return Text('SIGNATURE: ${data.data}');
                //   },
                //   future: SmsRetriever.getAppSignature(),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50.0),
                  child: textFiedlOtem(
                    otpController,
                    'Enter Your OTP',
                  ),
                ),
                submitbutton(otpController, widget.phone, context)

                // FutureBuilder(
                //   builder: (context, data) {
                //     return Text('SIGNATURE: ${data.data}');
                //   },
                //   future: SmsRetriever.getAppSignature(),
                // ),
                // Text('SMS CODE: $_smsCode \n'),
                // Text('Press the button below to start\nlistening for an incoming SMS'),
                // new RaisedButton(
                //   onPressed: () async {
                //     print(await SmsRetriever.getAppSignature());
                //     isListening = true;
                //     setState(() {});
                //     String smsCode = await SmsRetriever.startListening();
                //     _smsCode = getCode(smsCode);
                //     isListening = false;
                //     setState(() {});
                //     SmsRetriever.stopListening();
                //   },
                //   child: Text(isListening ? "STOP" : "START"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
