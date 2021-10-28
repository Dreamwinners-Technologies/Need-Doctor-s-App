import 'dart:convert';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'https://api.a2sdms.com';

final storage = FlutterSecureStorage();

Future<Data> getOthersPrescriptionList({
  String phoneNo,
  int pinNo,
  int pageNo,
  int pageSize,
}) async {
  print('Hi');
  print(pageNo);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };


  var res = await http.get(
      '$SERVER_IP/appointments/prescriptions/others?pageNo=$pageNo&pageSize=$pageSize&phoneNo=$phoneNo&pinNo=$pinNo',
      // url,
      headers: headers);
  print(res);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);
  if (res.statusCode == 200) {
    PrescriptionModel prescriptionListResponse =
        prescriptionModelFromJson(body);
    print(prescriptionListResponse.data.totalItems);
    sendToast(prescriptionListResponse.message);

    return prescriptionListResponse.data;
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;
    if (msg.contains("JWT")) {
      await storage.deleteAll();
storage.write(key: "isNewApp", value: "false");
      sendToast("Please Logout or Restart your application");
    }
    if (!msg.contains(
        'query did not return a unique result: 2; nested exception is javax.persistence.NonUniqueResultException: query did not return a unique result: 2')) {
      sendToast(msg);
    }
    throw new Exception(msg);
  }
}
