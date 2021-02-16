import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/AddCardRequest.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';

const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
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

Future<MessageIdResponse> addCard({AddCardRequest addCardRequest}) async {
  print('Hi');
  print(addCardRequest.name);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  final requestData = jsonEncode(addCardRequest.toJson());
  print(requestData);
  var res = await http.post("$SERVER_IP/cards",
      body: requestData, headers: headers);
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

    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<CardListResponse> getCardList({String name, String district, String specialization, int pageNo, int pageSize}) async {
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
  print("$SERVER_IP/cards?district=$district&name=$name&pageNo=$pageNo&pageSize=$pageSize&specialization=$specialization");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  var res = await http.get(
      "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
       headers: headers);

  // var res = await http.get(
  //     "$SERVER_IP/cards?district=$district&name=$name&pageNo=$pageNo&pageSize=$pageSize&specialization=$specialization",
  //     headers: headers);
  print(res.statusCode);

  if (res.statusCode == 200) {
    CardListResponse cardListResponse = cardListResponseFromJson(res.body);
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