import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/Card/CardSearchRequest.dart';
import 'package:need_doctors/models/Drug/AddDrugRequest.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/models/Drug/GenericResponse.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';

const SERVER_IP = 'http://need-doctors-backend.southeastasia.cloudapp.azure.com:8100';
// const SERVER_IP = 'http://192.168.31.5:8100';
final storage = FlutterSecureStorage();

Future<MessageIdResponse> addDrug({AddDrugRequest addDrugRequest}) async {
  print('Hi');
  print(addDrugRequest.name);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(addDrugRequest.toJson());
  print(requestData);
  var res;
  try {
    res = await http.post("$SERVER_IP/drugs",
        body: requestData, headers: headers);
  } on SocketException catch(e){
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

Future<MessageIdResponse> editDrug({AddDrugRequest addDrugRequest, String drugId}) async {
  print('Hi');
  print(addDrugRequest.name);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(addDrugRequest.toJson());
  print(requestData);
  var res;
  try {
    res = await http.put("$SERVER_IP/drugs/$drugId",
        body: requestData, headers: headers);
  } on SocketException catch(e){
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

Future<DrugListResponse> getDrugList({String name, String brand, String generic, int pageNo, int pageSize}) async {
  print('Hi');
  print(pageNo);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };


  print("$SERVER_IP/drugs?brand=$brand&generic=$generic&name=$name&pageNo=$pageNo&pageSize=$pageSize");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.get(
      "$SERVER_IP/drugs?brand=$brand&generic=$generic&name=$name&pageNo=$pageNo&pageSize=$pageSize",
      headers: headers );

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    DrugListResponse drugListResponse = drugListResponseFromJson(body);
    // print(drugListResponse.drugModelList);
    print(drugListResponse.totalItem);

    return drugListResponse;
  } else {
    String msg = ErrorResponseModel
        .fromJson(jsonDecode(res.body))
        .message;

    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<CardListResponse> getCardListAdvance({int pageNo, int pageSize, CardSearchRequest cardSearchRequest}) async {
  print('Hi');
  print(pageNo);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',

    'Authorization': 'Bearer $jwt'
  };

  print(cardSearchRequest.name);
  print(cardSearchRequest.district);
  print(cardSearchRequest.specialization);

  print("$SERVER_IP/cards/bangla");
  final requestData = jsonEncode(cardSearchRequest.toJson());
  print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.post(
      "$SERVER_IP/cards/bangla",
      headers: headers, body: requestData );

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    CardListResponse cardListResponse = cardListResponseFromJson(body);
    print(cardListResponse.cardInfoResponseList[0].name);
    print(cardListResponse.totalItem);

    return cardListResponse;
  } else {
    String msg = ErrorResponseModel
        .fromJson(jsonDecode(res.body))
        .message;

    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<List<String>> getGenericList({String genericName}) async {
  print('Hi');
  print(genericName);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',

    'Authorization': 'Bearer $jwt'
  };


  print("$SERVER_IP/drugs/generic?genericName=$genericName");

  var res = await http.get(
      "$SERVER_IP/drugs/generic?genericName=$genericName",
      headers: headers);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    List<String> genericListResponse = genericResponseFromJson(body);
    print(genericListResponse.length);

    return genericListResponse;
  } else {
    String msg = ErrorResponseModel
        .fromJson(jsonDecode(res.body))
        .message;

    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<MessageResponseModel> deleteDrug({String drugId}) async {
  print('Hi');
  print(drugId);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',

    'Authorization': 'Bearer $jwt'
  };


  print("$SERVER_IP/drugs/$drugId");

  var res = await http.delete(
      "$SERVER_IP/drugs/$drugId",
      headers: headers);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    MessageResponseModel messageResponse = messageResponseModelFromJson(res.body);
    print(messageResponse.message);
    sendToast(messageResponse.message);
    return messageResponse;
  } else {
    String msg = ErrorResponseModel
        .fromJson(jsonDecode(res.body))
        .message;

    sendToast(msg);

    throw new Exception(msg);
  }
}