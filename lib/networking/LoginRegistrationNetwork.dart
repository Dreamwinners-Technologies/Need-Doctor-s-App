import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/JwtResponseModel.dart';
import 'package:need_doctors/models/Login/LoginRequestModel.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';

import 'package:need_doctors/models/Registration/RegistrationRequestModel.dart';

const SERVER_IP = 'http://need-doctors-backend.southeastasia.cloudapp.azure.com:8100';
final storage = FlutterSecureStorage();

Future<JwtResponseModel> attemptLogIn({String phone}) async {
  print('Hi');
  LoginRequestModel loginRequestModel = LoginRequestModel(phone: phone);
  Map<String, String> headers = {'Content-Type': 'application/json'};
  final requestData = jsonEncode(loginRequestModel.toJson());
  print(requestData);
  var res = await http.post("$SERVER_IP/auth/login",
      body: requestData, headers: headers);
  print(res.statusCode);

  if (res.statusCode == 200) {
    JwtResponseModel jwtResponseModel =
    JwtResponseModel.fromJson(jsonDecode(res.body));
    print(jwtResponseModel.name);
    print(jwtResponseModel.phoneNo);

    return jwtResponseModel;
  } else {
    String msg = ErrorResponseModel
        .fromJson(jsonDecode(res.body))
        .message;
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      sendToast("Please Logout or Restart your application");
    }
    sendToast(msg);

    throw new Exception(msg);
  }
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
    print(messageResponseModel.message);

    String msg = messageResponseModel.message;

    sendToast(msg);

    return res.statusCode;
  } else {
    String errorMsg = ErrorResponseModel
        .fromJson(jsonDecode(res.body))
        .message;
    if (errorMsg.contains("JWT")) {
      await storage.deleteAll();
      sendToast("Please Logout or Restart your application");
    }
    sendToast(errorMsg);

    return res.statusCode;
  }
}

Future<JwtResponseModel> verifyOtp({int otp, String phoneNo}) async {
  print('Hi');
  Map<String, String> headers = {'Content-Type': 'application/json'};
  print("$SERVER_IP/auth/verify/otp?otp=$otp&phoneNo=$phoneNo");
  var res = await http.post(
      "$SERVER_IP/auth/verify/otp?otp=$otp&phoneNo=$phoneNo",
      headers: headers);
  print(res.body);

  if (res.statusCode == 200) {
    JwtResponseModel jwtResponseModel =
    JwtResponseModel.fromJson(jsonDecode(res.body));
    print(jwtResponseModel.name);

    return jwtResponseModel;
  } else {
    print(res.statusCode);
    String errorMsg = ErrorResponseModel
        .fromJson(jsonDecode(res.body))
        .message;
    if (errorMsg.contains("JWT")) {
      await storage.deleteAll();
      sendToast("Please Logout or Restart your application");
    }
    sendToast(errorMsg);

    throw new Exception(errorMsg);
  }
}
