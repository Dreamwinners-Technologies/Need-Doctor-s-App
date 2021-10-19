import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Admin/ModeratorListResponse.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';

const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'https://api.a2sdms.com';

final storage = FlutterSecureStorage();

Future<List<ModeratorListResponse>> getModeratorList() async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  print("$SERVER_IP/admin/moderators");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.get(
      "$SERVER_IP",
      headers: headers);

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
      sendToast("Please Logout or Restart your application");
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}


Future<MessageResponseModel> addModerator({String phone}) async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  print("$SERVER_IP?phoneNo=$phone");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.post(
      "$SERVER_IP?phoneNo=$phone",
      headers: headers);

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
      sendToast("Please Logout or Restart your application");
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<MessageResponseModel> deleteModerator({String phone}) async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  print("$SERVER_IP/$phone");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.delete(
      "$SERVER_IP/$phone",
      headers: headers);

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
      sendToast("Please Logout or Restart your application");
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}

