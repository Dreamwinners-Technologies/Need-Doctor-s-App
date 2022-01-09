import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';

import 'package:need_doctors/models/SupportTicketRequest.dart';
import 'package:need_doctors/models/api_message_response.dart';

// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
const SERVER_IP = 'https://api.a2sdms.com';

final storage = FlutterSecureStorage();

Future<ApiMessageResponse> createSupportTicketNetwork(
    SupportTicketRequest supportTicketRequest) async {
  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  var res = await http.post("$SERVER_IP/support-tickets",
      headers: headers, body: supportTicketRequestToJson(supportTicketRequest));

  if (res.statusCode == 201) {
    ApiMessageResponse apiMessageResponse =
        apiMessageResponseFromJson(res.body);

    return apiMessageResponse;
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      storage.write(key: "isNewApp", value: "false");
      sendToast("Please Logout or Restart your application");
    }
    print(msg);
    sendToast(msg);

    throw new Exception(msg);
  }
}
