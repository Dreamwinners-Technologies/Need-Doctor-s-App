import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/appointment/doctor_list_model.dart';
import 'package:need_doctors/networking/AdminNetwork.dart';

class DoctorListService {
  Future<DoctorResponse> getDoctorList({int pageNo, int pageSize}) async {
    print('Hi');
    print(pageNo);

    String jwt = await storage.read(key: 'jwtToken');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt'
    };

     var res = await http.get(
      'https://need-doctors-backend.herokuapp.com/appointments/doctors?pageNo=$pageNo&pageSize=$pageSize',
      headers: headers
    );

    print(res.statusCode);
    String body = utf8.decode(res.bodyBytes);

    print("Hi1");
    if (res.statusCode == 200) {
      print("Hi2");
      print(body);
      DoctorListModel cardListResponse = doctorListModelFromJson(body);

      print("Hi3");

      return cardListResponse.data;
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
}
