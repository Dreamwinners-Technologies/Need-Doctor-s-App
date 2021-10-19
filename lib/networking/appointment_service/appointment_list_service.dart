import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/appointment/appointment_list_model.dart';
import 'package:need_doctors/networking/AdminNetwork.dart';

const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'https://api.a2sdms.com';

class AppointmentListService {

  Future<MyAppointmentListModel> getAppoinmentList(
      {int pageNo, int pageSize}) async {
    print('Hi');
    print(pageNo);

    String jwt = await storage.read(key: 'jwtToken');

    Map<String, String> headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $jwt'};

    var res = await http.get('$SERVER_IP/appointments/users?pageNo=$pageNo&pageSize=$pageSize',
        headers: headers);

    print(res.statusCode);
    print(res.body);
    String body = utf8.decode(res.bodyBytes);

    print("Hi1");
    if (res.statusCode == 200) {
      print("Hi2");

      print(body);
      MyAppointmentListModel appointmentListResponse = myAppointmentListModelFromJson(body);

      print("Hi3");

      print(appointmentListResponse.message);

      return appointmentListResponse;
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
