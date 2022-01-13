import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/Profile/ProfileResponse.dart';
import 'package:need_doctors/models/Profile/profile_model.dart';

// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
const SERVER_IP = 'https://api.a2sdms.com';

final storage = FlutterSecureStorage();

Future<ProfileResponse> getProfile() async {
  print('Hi');

  print("0");
  String jwt = await storage.read(key: 'jwtToken');

  print("Jwt is: ");
  print(await storage.read(key: 'jwtToken'));

  print("1");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  print("2");

  var res = await http.get("$SERVER_IP/auth/profile", headers: headers);
  // print(res.statusCode);
  print(res);

  print("4");
  if (res.statusCode == 200) {
    ProfileResponse profileResponse = profileResponseFromJson(res.body);
    print(profileResponse.name);
    print(profileResponse.phoneNo);

    return profileResponse;
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

Future<MessageIdResponse> editProfile({ProfileModel data}) async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(data.toJson());
  print(requestData);
  var res;
  try {
    res = await http.put("$SERVER_IP/auth/profile/edit",
        body: requestData, headers: headers);
  } on SocketException catch (e) {
    sendToast("There is a problem in internet");
    throw new SocketException(e.message);
    // print(e);
    // print(1);
  }
  print(res.statusCode);

  if (res.statusCode == 200) {
    String body = utf8.decode(res.bodyBytes);
    MessageIdResponse messageIdResponse = messageIdResponseFromJson(body);
    print(messageIdResponse.message);
    sendToast(messageIdResponse.message);
    return messageIdResponse;
  } else {
    print(res.body);
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

// Future<int> attemptRegister({RegistrationRequestModel requestModel}) async {
//   print('Hi');
//   Map<String, String> headers = {'Content-Type': 'application/json'};
//   final requestData = jsonEncode(requestModel.toJson());
//   print(requestData);
//   var res = await http.post("$SERVER_IP/auth/registration",
//       body: requestData, headers: headers);
//   print(res.statusCode);
//
//   if (res.statusCode == 201) {
//     MessageResponseModel messageResponseModel =
//     MessageResponseModel.fromJson(jsonDecode(res.body));
//     print(messageResponseModel.message);
//
//     String msg = messageResponseModel.message;
//
//     sendToast(msg);
//
//     return res.statusCode;
//   } else {
//     String errorMsg = ErrorResponseModel
//         .fromJson(jsonDecode(res.body))
//         .message;
//     sendToast(errorMsg);
//
//     return res.statusCode;
//   }
// }

