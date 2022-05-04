import 'package:flutter/material.dart';
import 'package:travelappui/views/HomePage/homepage.dart';
import 'package:travelappui/views/Login/login.dart';
import 'package:travelappui/views/SplashScreen/splashscreen.dart';
import 'package:travelappui/views/ViewDetails/viewDetails.dart';
import 'package:travelappui/views/ForgotPassword/forgotPassword.dart';

import '../views/SignUp/signup.dart';

class AppRoutes {
  static const String ROUTE_Initial = ROUTE_Login;

  static const String ROUTE_Home = "/home";
  static const String ROUTE_Splashscreen = "/splash";
  static const String ROUTE_ViewDetails = "/view";
  static const String ROUTE_Login = "/login";
  static const String ROUTE_SignUp = "/signup";
  static const String ROUTE_ForgotPassword = "/forgotPassword";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_Home:
        return MaterialPageRoute(
            settings: settings, builder: (_) => HomePage());
        break;
      case ROUTE_Splashscreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SplashScreen());
        break;
      case ROUTE_ViewDetails:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ViewDetails());
        break;
      // case ROUTE_Login:
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => HomePage());
      //   break;
      case ROUTE_Login:
        return MaterialPageRoute(
            settings: settings, builder: (_) => LogInScreen());
        break;
      case ROUTE_SignUp:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SignUpScreen());
        break;
      case ROUTE_ForgotPassword:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ForgotPassword());
    }
  }
}
