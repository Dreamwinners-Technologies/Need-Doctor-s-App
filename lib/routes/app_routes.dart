import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/string/routes_name.dart';
import 'package:need_doctors/view/Appointment/get_appointment.dart';
import 'package:need_doctors/view/BottomNavi/Pagesetup.dart';
import 'package:need_doctors/view/PymentView/pyment_view.dart';
import 'package:need_doctors/view/Registration/RegistrationPage.dart';
import 'package:need_doctors/view/login/LoginPage.dart';
import 'package:need_doctors/view/otp/OtpScreen.dart';
import 'package:need_doctors/view/splash/SplashScreen.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  Route ongenarateRoutes(RouteSettings settings) {
    switch (settings.name) {
      //splash
      case START:
        return MaterialPageRoute(
            builder: (_) =>
                SplashScreen()); //Change here for check as a start view
        break;
      //login
      case LOGIN_VIEW:
        return PageTransition(
            type: PageTransitionType.rightToLeft, child: LoginScreen());
        break;
      //register
      case REGISTER_VIEW:
        return PageTransition(
           type: PageTransitionType.rightToLeft, child: RegistrationPage());
        break;

      //otp
      case OTP_VIEW:
        String phone = settings.arguments;
        return PageTransition(
            type: PageTransitionType.rightToLeft, child: OtpScreen(phone));
        break;

      //bottom navigation=> index == 0 or home view
      case BOTTOM_VIEW:
        return PageTransition(
            type: PageTransitionType.fade, child: PageSetup());
        break;

      case APPOINTMENT_ROUTE:
        return PageTransition(
            type: PageTransitionType.fade, child: GetAppointmentViw());
        break;

      case PYMENT_ROUTE:
        var information = settings.arguments;
        return PageTransition(
            type: PageTransitionType.fade,
            child: PymentView(information: information));
        break;
      default:
        print('View Not Found');
        return null;
    }
  }
}
