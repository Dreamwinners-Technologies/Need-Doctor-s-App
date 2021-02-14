import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/Login/LoginRequestModel.dart';
import 'package:need_doctors/models/Login/LoginResponseModel.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';
import 'package:need_doctors/models/Registration/RegistrationRequestModel.dart';

const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
final storage = FlutterSecureStorage();

Future<String> attemptLogIn(String phone) async {
  print('Hi');
  LoginRequestModel loginRequestModel = LoginRequestModel(phone: phone);
  Map<String, String> headers = {'Content-Type': 'application/json'};
  final requestData = jsonEncode(loginRequestModel.toJson());
  print(requestData);
  var res = await http.post("$SERVER_IP/auth/login",
      body: requestData, headers: headers);
  print(res.statusCode);

  if (res.statusCode == 200) {
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(res.body));
    print(loginResponseModel.name);
    print(loginResponseModel.phoneNo);
    String jwt = "Bearer ";
    return jwt;
  }
  print(ErrorResponseModel.fromJson(jsonDecode(res.body)).message);
  return null;
}

Future<int> attemptRegister({RegistrationRequestModel requestModel}) async {
  print('Hi');
  Map<String, String> headers = {'Content-Type': 'application/json'};
  final requestData = jsonEncode(requestModel.toJson());
  print(requestData);
  var res = await http.post("$SERVER_IP/auth/registration",
      body: requestData, headers: headers);
  print(res.statusCode);

  if (res.statusCode == 201) {
    MessageResponseModel messageResponseModel =
        MessageResponseModel.fromJson(jsonDecode(res.body));
    print(messageResponseModel.massage);

    String msg = messageResponseModel.massage;
    sendToast(msg);

    return res.statusCode;
  } else {
    String errorMsg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;
    sendToast(errorMsg);

    return res.statusCode;
  }
}


