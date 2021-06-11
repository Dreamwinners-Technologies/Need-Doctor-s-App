import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

imagset(double width) {
  return Container(
      margin: const EdgeInsets.only(top: 12.0),
      height: width / 2.5,
      width: width / 2.5,
      child: Lottie.asset('asset/lottie/otp_lottie.json'));
}
