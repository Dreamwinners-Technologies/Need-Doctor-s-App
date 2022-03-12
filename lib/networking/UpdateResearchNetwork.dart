import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDetailsModel.dart';
import 'package:http/http.dart' as http;

import '../ENV.dart';

const SERVER_IP = ENV.SERVER_IP;

final storage = FlutterSecureStorage();

Future<ResearchDetailsModel> searchResearchData({int pageNo, int pageSize}) async {
  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $jwt'
  };

  String apiLink = "$SERVER_IP/api/research/?pageNo=$pageNo&pageSize=$pageSize";
  print(apiLink);

  var res = await http.get(apiLink, headers: headers);

  print(res.statusCode);
  // String body = utf8.decode(res.bodyBytes);

  if (res.statusCode == 200) {
    ResearchDetailsModel researchDetailsModel =
        researchDetailsModelFromJson(res.body);
    // print(drugListResponse.drugModelList);
    print(researchDetailsModel.data.totalItems);

    return researchDetailsModel;
  } else {
    ErrorResponseModel errorResponseModel =
        errorResponseModelFromJson(res.body);

    sendToast(errorResponseModel.message);

    throw new Exception(errorResponseModel.message);
  }
}
