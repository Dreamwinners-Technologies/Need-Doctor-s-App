import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/appointment/appointment_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

Uri url = Uri.parse('https://need-doctors-backend.herokuapp.com/appointments');

class CreateAppointmentService {
  Future<AppointmentModel> createAppointment(
      AppointmentModel appointment, BuildContext context) async {
    String jwt = await storage.read(key: 'jwtToken');
    print('Starting create appointment');
    print(appointment.patientName);
    print(jwt);

    //header
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt',
      //'jwtToken': 'Bearer $jwt'
    };

    //request

    final requestAppointmentData = jsonEncode(appointment.toJson());
    print(requestAppointmentData);

    var res;

    try {
      res =
          await http.post(url, headers: headers, body: requestAppointmentData);
    } on SocketException catch (e) {
      sendToast("Network Error");
      print(e);
    }

    print(res.statusCode);

    if (res.statusCode == 201) {
      return AppointmentModel.fromJson(res.body);
    } else {
      String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;

      print(res.body);
      if (msg.contains("JWT")) {
        await storage.deleteAll();
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Log In Expired',
            desc: 'Please Log Out And Log In Again');
      }
      sendToast(msg);

      throw new Exception(msg);
    }
  }
}
