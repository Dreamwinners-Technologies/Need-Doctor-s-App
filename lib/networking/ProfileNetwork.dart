import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/Profile/ProfileResponse.dart';


const SERVER_IP = 'http://need-doctors-backend.southeastasia.cloudapp.azure.com:8100';
final storage = FlutterSecureStorage();

Future<ProfileResponse> getProfile() async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',

    'Authorization': 'Bearer $jwt'
  };


  var res = await http.get("$SERVER_IP/auth/profile",
       headers: headers);
  print(res.statusCode);

  if (res.statusCode == 200) {
    ProfileResponse profileResponse = profileResponseFromJson(res.body);
    print(profileResponse.name);
    print(profileResponse.phoneNo);

    return profileResponse;
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

