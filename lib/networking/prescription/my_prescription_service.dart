import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';

import '../../ENV.dart';

// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'https://api.a2sdms.com';

final storage = FlutterSecureStorage();

Future<Data> getMyPrescriptionList({
  String query,
  int pageNo,
  int pageSize,
}) async {
  print(pageNo);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $jwt'};

  var res = await http.get(ENV.SERVER_IP + '/appointments/prescriptions?pageNo=$pageNo&pageSize=$pageSize', headers: headers);

  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    PrescriptionModel prescriptionListResponse = prescriptionModelFromJson(body);

    print(prescriptionListResponse.data.totalItems);

    return prescriptionListResponse.data;
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      storage.write(key: "isNewApp", value: "false");
      sendToast("Please Logout or Restart your application");
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}
