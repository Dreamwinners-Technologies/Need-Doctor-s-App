import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/ENV.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';

import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';
import 'package:need_doctors/models/ambulance/AddAmbulanceRequest.dart';
import 'package:need_doctors/models/ambulance/publicAmbulanceRequest.dart';
import 'package:need_doctors/models/api_message_response.dart';

// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'https://api.a2sdms.com';

final storage = FlutterSecureStorage();

Future<MessageIdResponse> addAmbulance(
    {AddAmbulanceRequest addAmbulanceRequest}) async {
  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(addAmbulanceRequest.toJson());
  print(requestData);
  var res;
  try {
    res = await http.post(ENV.SERVER_IP + "/api/ambulance",
        body: requestData, headers: headers);
  } on SocketException catch (e) {
    sendToast("There is a problem in internet");
    throw new SocketException(e.message);
    // print(e);
    // print(1);
  }
  print(res.statusCode);

  if (res.statusCode == 201) {
    MessageIdResponse messageIdResponse = messageIdResponseFromJson(res.body);
    print(messageIdResponse.message);
    sendToast(messageIdResponse.message);
    return messageIdResponse;
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

Future<ApiMessageResponse> addPublicAmbulance(
    {PublicAmbulanceRequest publicAmbulanceRequest}) async {
  print('Hi');
  print(publicAmbulanceRequest.name);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  final requestData = jsonEncode(publicAmbulanceRequest.toJson());
  print(requestData);
  var res;
  try {
    res = await http.post(ENV.SERVER_IP + "/ambulance/requests",
        body: requestData, headers: headers);
  } on SocketException catch (e) {
    sendToast("There is a problem in internet");
    throw new SocketException(e.message);
  }
  print(res.statusCode);

  if (res.statusCode == 201) {
    final apiMessageResponse = apiMessageResponseFromJson(res.body);
    print(apiMessageResponse.message);
    sendToast(apiMessageResponse.message);
    return apiMessageResponse;
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

Future<MessageIdResponse> editAmbulance(
    {AddAmbulanceRequest addAmbulanceRequest, String ambulanceId}) async {
  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(addAmbulanceRequest.toJson());

  var res;
  try {
    res = await http.put(ENV.SERVER_IP + "/ambulance/$ambulanceId",
        body: requestData, headers: headers);
  } on SocketException catch (e) {
    sendToast("There is a problem in internet");
    throw new SocketException(e.message);
    // print(e);
    // print(1);
  }
  print(res.statusCode);

  if (res.statusCode == 200) {
    MessageIdResponse messageIdResponse = messageIdResponseFromJson(res.body);
    print(messageIdResponse.message);
    sendToast(messageIdResponse.message);
    return messageIdResponse;
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

Future<AddAmbulanceRequest> addAmbulanceList(
    {String name,
    String phone,
    String title,
    String division,
    String district,
    String thana}) async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  print(ENV.SERVER_IP +
      "/ambulance?name=$name&phone=$phone&title=$title&division=$division&district=$district&thana=$thana");

  var res = await http.get(
      ENV.SERVER_IP +
          "/drugs?name=$name&phone=$phone&title=$title&division=$division&district=$district&thana=$thana",
      headers: headers);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    AddAmbulanceRequest addAmbulanceRequest = addAmbulanceRequestFromJson(body);
    // print(drugListResponse.drugModelList);
    print(addAmbulanceRequest);

    return AddAmbulanceRequest();
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;

    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<MessageResponseModel> deleteAmbulance({String ambulanceId}) async {
  print('Hi');
  print(ambulanceId);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  print(ENV.SERVER_IP + "/ambulance/$ambulanceId");

  var res = await http.delete(ENV.SERVER_IP + "/ambulance/$ambulanceId",
      headers: headers);

  print(res.statusCode);
  // ignore: unused_local_variable
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    MessageResponseModel messageResponse =
        messageResponseModelFromJson(res.body);
    print(messageResponse.message);
    sendToast(messageResponse.message);
    return messageResponse;
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;

    sendToast(msg);

    throw new Exception(msg);
  }
}
