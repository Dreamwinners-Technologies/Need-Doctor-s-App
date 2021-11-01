import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/appointment/appointment_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
const SERVER_IP = 'https://api.a2sdms.com';

final storage = FlutterSecureStorage();

class CreateAppointmentService {
  Future<MessageIdResponse> createAppointment(
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
          await http.post("$SERVER_IP/appointments", headers: headers, body: requestAppointmentData);
    } on SocketException catch (e) {
      sendToast("No Network Connection");
      print(e);
    }

    print(res.statusCode);

    if (res.statusCode == 201) {
      print(res.body);
      MessageIdResponse messageIdResponse = messageIdResponseFromJson(res.body);
      print(messageIdResponse.message);
      sendToast(messageIdResponse.message);
      return messageIdResponse;
    } else {
      String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;

      print(res.body);
      if (msg.contains("JWT")) {
        await storage.deleteAll();
storage.write(key: "isNewApp", value: "false");
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
