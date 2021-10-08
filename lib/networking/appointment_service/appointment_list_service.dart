import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/appointment/appointment_list_model.dart';
import 'package:need_doctors/networking/AdminNetwork.dart';

class AppointmentListService {
  
Future<AppointmentListModel> getOwnPriscriptionList(
    { int pageNo, int pageSize}) async {
  print('Hi');
  print(pageNo);

  String jwt = await storage.read(key: 'jwtToken');

  Map<String, String> headers = {
    'Content-Type': 'application/json',

    'Authorization': 'Bearer $jwt'
  };

  var res = await http.get( "$SERVER_IP/appointments/prescriptions?pageSize=$pageSize", headers: headers);

  print(res.statusCode);
  String body = utf8.decode(res.bodyBytes);
  print("Hi1");
  if (res.statusCode == 200) {
    print("Hi2");
    AppointmentListModel cardListResponse = appointmentListModelFromJson(body);
    print("Hi3");
    print(cardListResponse.data);

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
}