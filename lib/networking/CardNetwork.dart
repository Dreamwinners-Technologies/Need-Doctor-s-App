import 'dart:io';


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/AddCardRequest.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/Card/CardSearchRequest.dart';
import 'package:need_doctors/models/Card/OwnCardEditRequest.dart';
import 'package:need_doctors/models/Card/OwnCardResponse.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';

const SERVER_IP = 'http://need-doctors-backend.southeastasia.cloudapp.azure.com:8100';
// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'http://192.168.31.5:8100';
final storage = FlutterSecureStorage();


Future<int> uploadFile({String cardId, File image}) async {
  print('Hi');
  print(image.path);

  var postUrl = Uri.parse("$SERVER_IP/cards/addImage/$cardId");
  http.MultipartRequest request = http.MultipartRequest("POST", postUrl);
  http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'file', image.path);
  request.files.add(multipartFile);

  http.StreamedResponse response = await request.send();


  response.stream.transform(utf8.decoder).listen((res) {
    if (response.statusCode == 201) {
      print(res);
      MessageResponseModel messageResponseModel = messageResponseModelFromJson(
          res);
      print(messageResponseModel.message);
      sendToast(messageResponseModel.message);
    }
    else {
      ErrorResponseModel errorResponseModel = errorResponseModelFromJson(res);

      sendToast(errorResponseModel.message);
      throw new Exception(errorResponseModel.message);
    }
  });

  return response.statusCode;
}

Future<MessageIdResponse> addCard(
    {AddCardRequest addCardRequest, BuildContext context}) async {
  print('Hi');
  print(addCardRequest.name);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(addCardRequest.toJson());
  print(requestData);
  var res;
  try {
    res = await http.post("$SERVER_IP/cards",
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
    String msg = ErrorResponseModel
        .fromJson(jsonDecode(res.body))
        .message;

    print(res.body);
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          tittle: 'Log In Expired',
          desc: 'Please Log Out And Log In Again'
      );
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<CardListResponse> getCardList(
    {String name, String district, String specialization, int pageNo, int pageSize, String thana}) async {
  print('Hi');
  print(pageNo);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',

    'Authorization': 'Bearer $jwt'
  };

  print(name);
  print(district);
  print(specialization);
  print(
      "$SERVER_IP/cards?district=$district&name=$name&pageNo=$pageNo&pageSize=$pageSize&specialization=$specialization");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.get(
      "$SERVER_IP/cards?district=$district&name=$name&pageNo=$pageNo&pageSize=$pageSize&specialization=$specialization",
      headers: headers);

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
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      sendToast("Please Logout or Restart your application");
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<CardListResponse> getCardListAdvance(
    {int pageNo, int pageSize, CardSearchRequest cardSearchRequest}) async {
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
      headers: headers, body: requestData);

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
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      sendToast("Please Logout or Restart your application");
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<OwnCardResponse> getOwnCard() async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',

    'Authorization': 'Bearer $jwt'
  };

  print("$SERVER_IP/card/own");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.get(
      "$SERVER_IP/card/own",
      headers: headers);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    OwnCardResponse ownCardResponse = ownCardResponseFromJson(body);
    print(ownCardResponse.name);

    return ownCardResponse;
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

Future<MessageIdResponse> editOwnCard(
    {OwnCardEditRequest ownCardEditRequest}) async {
  print('Hi');
  print(ownCardEditRequest.name);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(ownCardEditRequest.toJson());
  print(requestData);
  var res;
  try {
    res = await http.put("$SERVER_IP/card/own",
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


Future<MessageIdResponse> deleteCard({String cardId}) async {
  print('Hi');
  print(cardId);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',

    'Authorization': 'Bearer $jwt'
  };


  print("$SERVER_IP/cards/edit/$cardId");

  var res = await http.delete(
      "$SERVER_IP/cards/edit/$cardId",
      headers: headers);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    MessageIdResponse messageResponse = messageIdResponseFromJson(res.body);
    print(messageResponse.message);
    sendToast(messageResponse.message);
    return messageResponse;
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

Future<MessageIdResponse> editCard(
    {AddCardRequest addCardRequest, String cardId}) async {
  print('Hi');
  print(addCardRequest.name);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(addCardRequest.toJson());
  print(requestData);
  var res;
  try {
    print("$SERVER_IP/cards/edit/$cardId");
    res = await http.put("$SERVER_IP/cards/edit/$cardId",
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
    print(res.body);
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