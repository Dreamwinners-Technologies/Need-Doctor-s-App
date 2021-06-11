 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/view/login/LoginPage.dart';
import 'package:need_doctors/view/Pagesetup.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
final storage = FlutterSecureStorage();



MaterialPageRoute nextScreen(String token) {
    if (token == null) {
      return MaterialPageRoute(
        builder: (_) => LoginScreen(),
      );
    } else {
      Map<String, dynamic> decodedToken = parseJwt(token);

      int expTime = int.parse(decodedToken['exp'].toString()) * 1000;
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      expTime -= 20000000;

      print(expTime);
      print(currentTime);

      if (expTime > currentTime) {
        return MaterialPageRoute(
          builder: (_) => PageSetup(),
        );
      } else {
        sendToast("Token Expired. Please Login Again");
        storage.deleteAll();
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      }
    }

    

    
  }

   Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }


  
  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }