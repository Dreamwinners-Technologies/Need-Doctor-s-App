import 'dart:async';

import 'package:get/get.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:sms_maintained/sms.dart';

class OtpController extends GetxController {
  //for payment
  var otpCode = ''.obs;
  SmsQuery query = SmsQuery();
  var isFeatching = true.obs;
  var isFound = false.obs;
  var count = 0.obs;
  String currentData, smsData, smsMinute, currentMinute;
  
  var phone;
  // List<SmsMessage> messages = <SmsMessage>[];

  @override
  void onInit() {
    Timer(Duration(seconds: 10), () => fetchOtpSMS());
    super.onInit();
  }

  fetchOtpSMS() async {
    //current area
    DateTime now = DateTime.now();

    print(1);

    String day;

    if (now.day < 9) {
      day = '0' + now.day.toString();
    } else {
      day = now.day.toString();
    }
    currentData = now.year.toString() + '-' + now.month.toString() + '-' + day;
    print("current data:" + currentData);
    currentMinute = now.minute.toString();
    print("current minute:" + currentMinute);

    //loading

    var messageslist = await query.getAllSms;
    for (var item in messageslist) {
      print(2);
      if (item.sender == '+8809601001357') {
        print(3);
        //sms data and time checkingels
        smsData = item.date.toString().split(' ').first;
        print("SMS Date:" + smsData);
        String smshour = item.date.toString().split(' ').last.split(':').first;
        smsMinute = item.date
            .toString()
            .split(' ')
            .last
            .split('$smshour:')
            .last
            .split(':')
            .first;
        print('SMS Minute:' + smsMinute);
        int intCurrentMinute = int.parse(currentMinute);
        int intSmsMinute = int.parse(smsMinute);

        if (currentData == smsData) {
          if (intSmsMinute == (intCurrentMinute + .5) ||
              intSmsMinute == intCurrentMinute) {
            print(4);
            otpCode.value = item.body.split('OTP is: ').last.split('.').first;
            isFeatching(false);
          } else {
            isFeatching(false);
          }
          break;
        }
      } else {
        isFeatching(false);
        break;
      }
    }

    isFeatching(false);
    //if not found

    if (otpCode.isEmpty) {
      print('otp not found');
      sendToast(
          "Sorry! Maybe register phone number are not inserted in this device\nType your OTP manually");
      isFeatching(false);
    } else {
      print('otp  found');
      sendToast("Got OTP code Successfully");
      print(otpCode);
      isFeatching(false);
    }
  }

  @override
  void onClose() {
    otpCode.value = '';
    super.onClose();
  }
}
