import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/AddCardRequest.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/Card/CardSearchRequest.dart';
import 'package:need_doctors/models/Card/OwnCardEditRequest.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';
import 'package:need_doctors/models/api_message_response.dart';

import '../ENV.dart';

// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'https://api.a2sdms.com';
const SERVER_IP = ENV.SERVER_IP;

final storage = FlutterSecureStorage();

Future<int> uploadFile({String cardId, File image}) async {
  print('Hi');
  print(image.path);

  var postUrl = Uri.parse("$SERVER_IP/cards/addImage/$cardId");
  http.MultipartRequest request = http.MultipartRequest("POST", postUrl);
  http.MultipartFile multipartFile =
      await http.MultipartFile.fromPath('file', image.path);
  request.files.add(multipartFile);

  http.StreamedResponse response = await request.send();

  response.stream.transform(utf8.decoder).listen((res) {
    if (response.statusCode == 201) {
      print(res);
      MessageResponseModel messageResponseModel =
          messageResponseModelFromJson(res);
      print(messageResponseModel.message);
      sendToast(messageResponseModel.message);
    } else {
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
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;

    print(res.body);
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      storage.write(key: "isNewApp", value: "false");
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Log In Expired',
          desc: 'Please Log Out And Log In Again');
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}

//add card public

Future<int> uploadFilePublic({String cardId, File image}) async {
  print('Hi');
  print(image.path);

  var postUrl = Uri.parse("$SERVER_IP/cards/public/upload-image/$cardId");
  http.MultipartRequest request = http.MultipartRequest("POST", postUrl);
  http.MultipartFile multipartFile =
      await http.MultipartFile.fromPath('file', image.path);
  request.files.add(multipartFile);

  http.StreamedResponse response = await request.send();
  print(response.statusCode);

  response.stream.transform(utf8.decoder).listen((res) {
    if (response.statusCode == 200) {
      print(res);
      MessageResponseModel messageResponseModel =
          messageResponseModelFromJson(res);
      print(messageResponseModel.message);
      sendToast(messageResponseModel.message);
    } else {
      ErrorResponseModel errorResponseModel = errorResponseModelFromJson(res);

      sendToast(errorResponseModel.message);
      throw new Exception(errorResponseModel.message);
    }
  });

  return response.statusCode;
}

Future<MessageIdResponse> addCardPubulic(
    {AddCardRequest addCardRequest, BuildContext context}) async {
  print('public card');
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
    res = await http.post("$SERVER_IP/cards/public",
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
    print(messageIdResponse.id);
    sendToast('Created Card');
    return messageIdResponse;
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;

    print(res.body);
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      storage.write(key: "isNewApp", value: "false");
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Log In Expired',
          desc: 'Please Log Out And Log In Again');
    }
    sendToast(msg);

    throw new Exception(msg);
  }
}

Future<CardListResponse> getCardList(
    {String name,
    String district,
    String division,
    int pageNo,
    int pageSize,
    String thana}) async {
  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  // String url = "$SERVER_IP/cards?district=$district&name=$name&pageNo=$pageNo&pageSize=$pageSize&specialization=$specialization";
  String url = "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize";

  if (name != null) url += "&name=$name";
  if (division != null) url += "&specialization=$division";
  if (thana != null) url += "&thana=$thana";
  if (district != null) url += "&district=$district";

  print(name);
  print(district);
  print(division);
  print(url);
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);
  //      headers: headers);

  var res = await http.get(url, headers: headers);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);
  print(url);

  if (res.statusCode == 200) {
    CardListResponse cardListResponse = cardListResponseFromJson(body);

    // print(cardListResponse.cardInfoResponseList[0].name);
    print(cardListResponse.totalItem);

    return cardListResponse;
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

  var res = await http.post("$SERVER_IP/cards/bangla",
      headers: headers, body: requestData);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    CardListResponse cardListResponse = cardListResponseFromJson(body);
    print(cardListResponse.cardInfoResponseList[0].name);
    print(cardListResponse.totalItem);

    return cardListResponse;
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

Future<CardInfoResponse> getOwnCard() async {
  print('Hi');

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };
  print(jwt);

  print("$SERVER_IP/card/own");
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  var res = await http.get("$SERVER_IP/card/own", headers: headers);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    CardInfoResponse ownCardResponse =
        CardInfoResponse.fromJson(json.decode(body));
    print(ownCardResponse.name);

    return ownCardResponse;
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      storage.write(key: "isNewApp", value: "false");
      sendToast("Please Logout or Restart your application");
    } else if (msg.contains("query did not return a unique result")) {
      sendToast(
          "Multiple Card Available. Please Delete All Cards First with CleanUp Button");
    } else {
      sendToast(msg);
    }
    return null;
    // throw new Exception(msg);
  }
}

Future<ApiMessageResponse> cleanUpCards() async {
  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  var res = await http.delete("$SERVER_IP/card/own/clean-up", headers: headers);

  print(res.statusCode);

  if (res.statusCode == 200) {
    ApiMessageResponse apiMessageResponse =
        apiMessageResponseFromJson(res.body);

    return apiMessageResponse;
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;
    if (msg.contains("JWT")) {
      await storage.deleteAll();
      storage.write(key: "isNewApp", value: "false");
      sendToast("Please Logout or Restart your application");
    } else if (msg.contains("query did not return a unique result")) {
      sendToast(
          "Multiple Card Available. Please Delete All Cards First with CleanUp Button");
    } else {
      sendToast(msg);
    }

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

Future<MessageIdResponse> deleteCard({String cardId}) async {
  print('Hi');
  print(cardId);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  print("$SERVER_IP/cards/edit/$cardId");

  var res =
      await http.delete("$SERVER_IP/cards/edit/$cardId", headers: headers);

  print(res.statusCode);
  // ignore: unused_local_variable
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    MessageIdResponse messageResponse = messageIdResponseFromJson(res.body);
    print(messageResponse.message);
    sendToast(messageResponse.message);
    return messageResponse;
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
