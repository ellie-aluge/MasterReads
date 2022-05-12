import 'package:flutter/material.dart';
import 'package:masterreads/views/home/welcomePage.dart';
import 'package:masterreads/views/login/login_screen.dart';
import 'package:masterreads/views/signUp/register_screen.dart';
import 'package:masterreads/views/forgotPassword/forgot_password.dart';

class AppRoutes {
  static const String routeInitial = routeWelcome;

  static const String routeLogin = "/login";
  static const String routeSignUp = "/signup";
  static const String routeForgotPassword = "/forgotPassword";
  static const String routeWelcome = "/welcomePage";


  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute(
            settings: settings, builder: (_) => LoginPage(title: 'Login UI'));
        break;
      case routeSignUp:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => RegisterPage(title: 'Register UI'));
        break;

      case routeWelcome:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => welcomePage());
        break;

      case routeForgotPassword:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ForgotPassword());
        break;
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => welcomePage());
    }
  }
}
