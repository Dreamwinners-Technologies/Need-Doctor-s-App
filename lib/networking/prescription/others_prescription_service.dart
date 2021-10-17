import 'dart:convert';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  // String url = 'http://127.0.0.1:8100/appointments/prescriptions/others?pageNo=$pageNo&pageSize=$pageSize&phoneNo=$phoneNo&pinNo=$pinNo';
  // print(url);
  var res = await http.get(
      'https://need-doctors-backend.herokuapp.com/appointments/prescriptions/others?pageNo=$pageNo&pageSize=$pageSize&phoneNo=$phoneNo&pinNo=$pinNo',
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
      sendToast("Please Logout or Restart your application");
    }
    if (!msg.contains(
        'query did not return a unique result: 2; nested exception is javax.persistence.NonUniqueResultException: query did not return a unique result: 2')) {
      sendToast(msg);
    }
    throw new Exception(msg);
  }
}
