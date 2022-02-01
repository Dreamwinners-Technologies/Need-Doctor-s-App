import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Admin/ModeratorListResponse.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';

import '../ENV.dart';

// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'https://api.a2sdms.com';

final storage = FlutterSecureStorage();

Future<List<ModeratorListResponse>> getModeratorList() async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $jwt'};

  String url = ENV.SERVER_IP + "/admin/moderators";
  print(url);
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.get(url, headers: headers);

  print(res.statusCode);
  // ignore: unused_local_variable
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    List<ModeratorListResponse> moderatorListResponse = moderatorListResponseFromJson(res.body);
    // print(drugListResponse.drugModelList);
    print(moderatorListResponse.length);

    return moderatorListResponse;
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

Future<MessageResponseModel> addModerator({String phone}) async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $jwt'};

  String url = ENV.SERVER_IP + "/admin/moderators";
  print(url);

  print("$url?phoneNo=$phone");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.post("$url?phoneNo=$phone", headers: headers);

  print(res.statusCode);

  if (res.statusCode == 200) {
    MessageResponseModel messageResponseModel = messageResponseModelFromJson(res.body);
    // print(drugListResponse.drugModelList);
    print(messageResponseModel.message);

    sendToast(messageResponseModel.message);
    return messageResponseModel;
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

Future<MessageResponseModel> deleteModerator({String phone}) async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $jwt'};

  print(ENV.SERVER_IP + "/$phone");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.delete(ENV.SERVER_IP + "/$phone", headers: headers);

  print(res.statusCode);

  if (res.statusCode == 200) {
    MessageResponseModel messageResponseModel = messageResponseModelFromJson(res.body);
    // print(drugListResponse.drugModelList);
    print(messageResponseModel.message);

    sendToast(messageResponseModel.message);
    return messageResponseModel;
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
