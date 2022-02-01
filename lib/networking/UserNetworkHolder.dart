//

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:need_doctors/Constant/string/app_info.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ErrorResponseModel.dart';
import 'package:need_doctors/models/Profile/profile_model.dart';

import '../ENV.dart';

// const SERVER_IP = 'https://need-doctors-backend.herokuapp.com';
// const SERVER_IP = 'https://api.a2sdms.com';
const SERVER_IP = ENV.SERVER_IP;

final storage = FlutterSecureStorage();

Future<ProfileModel> getUsers() async {
  print('Hi');
  print('featching user profile info');

  String jwt = await storage.read(key: 'jwtToken');
  String jwt1 = await storage.read(key: "userType");

  Map<String, String> headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $jwt'};

  var res = await http.get("$SERVER_IP/auth/profile", headers: headers);
  print(res.statusCode);
  print(jwt1);

  if (res.statusCode == 200) {
    ProfileModel profileModel = profileModelFromJson(res.body);
    await storage.write(key: userNAME, value: profileModel.name);
    await storage.write(key: profileJson, value: res.body);
    // print(res.body);
    return profileModel;
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
/*class UserNetworkHolder {
  //
  static const String url = 'https://api.a2sdms.com/';

  static Future<List<UserModel>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<UserModel> users = userModelFromJson(response.body) as List<UserModel>;
        return users;
      } else {
        return List<UserModel>();
      }
    } catch (e) {
      return List<UserModel>();
    }
  }
} */

/*class ProfileNetworkHandler {
  String baseurl = 'https://api.a2sdms.com';
  var log = Logger();
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future get(String url) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    // /user/register
    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);

      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.post(
      url,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.patch(
      url,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> post1(String url, var body) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.post(
      url,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  String formater(String url) {
    return baseurl + url;
  
  }
}*/
