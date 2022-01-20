import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/ambulance/get_ambulance_model.dart';

import '../../ENV.dart';


final storage = FlutterSecureStorage();

Future<GetAmbulanceModel> getAmbulanceList({int pageNo, int pageSize}) async {
  print('Hi');
  print(pageNo);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  String url = ENV.SERVER_IP + "/api/ambulance?isApproved=true&pageNo=$pageNo&pageSize=$pageSize";

  print(url);
  // final requestData = jsonEncode(addCardRequest.toJson());
  // print(requestData);
  // var res = await http.get(
  //     "$SERVER_IP/cards?pageNo=$pageNo&pageSize=$pageSize",
  //      headers: headers);

  print('I am ambulance list fetcher');
  // var res = await http.get(
  //     "https://need-doctors-backend.herokuapp.com/api/ambulance?isApproved=true&pageNo=0&pageSize=20",
  //     headers: headers);
  var res = await http.get(
      url,
      headers: headers);
  print(res.body);
  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    // print(res.body);
    GetAmbulanceModel abmulanceListResponse = getAmbulanceModelFromJson(body);
    // print(drugListResponse.drugModelList);
    print(abmulanceListResponse.totalItems);

    return abmulanceListResponse;
  } else {
    String msg = ErrorResponseModel.fromJson(jsonDecode(res.body)).message;

    sendToast(msg);

    throw new Exception(msg);
  }
}
