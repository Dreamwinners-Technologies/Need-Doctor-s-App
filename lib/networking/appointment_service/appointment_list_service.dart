import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/appointment/appointment_list_model.dart';
import 'package:need_doctors/networking/AdminNetwork.dart';

class AppointmentListService {
  Future<AppointmentResponse> getAppoinmentList(
      {int pageNo, int pageSize}) async {
    print('Hi');
    print(pageNo);

    String jwt = await storage.read(key: 'jwtToken');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1MDE4NjY0Nzg5NDEiLCJzY29wZXMiOiJVU0VSIiwiaWF0IjoxNjM0NDQ4OTYzLCJleHAiOjE2MzY1NDg5NjN9.B0Rm1Pk1WdUW7gaKfVT2xOL1SslDzZ0tAzG0zvNE1kuluzr_nY4bmq0w_xwRC2cXF7FfkDw247RkiFSgmGz2qw'
    };

    var res = await http.get(
        'https://need-doctors-backend.herokuapp.com/appointments/users?pageNo=$pageNo&pageSize=$pageSize',
        headers: headers);

    print(res.statusCode);
    print(res.body);
    String body = utf8.decode(res.bodyBytes);

    print("Hi1");
    if (res.statusCode == 200) {
      print("Hi2");
      print(body);
      MyAppointmentListModel appointmentListResponse =
          myAppointmentListModelFromJson(body);

      print("Hi3");

      return appointmentListResponse.data;
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
