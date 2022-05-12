import 'package:flutter/material.dart';
import 'package:masterreads/views/login/login_screen.dart';
import 'package:masterreads/views/signUp/register_screen.dart';
import 'package:masterreads/views/forgotPassword/forgot_password.dart';

import '../views/user/profile.dart';

class AppRoutes {
  static const String routeInitial = routeLogin;

  static const String routeLogin = "/login";
  static const String routeSignUp = "/signup";
  static const String routeForgotPassword = "/forgotPassword";
  static const String routeProfilePage = "/profilePage";

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
      case routeForgotPassword:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ForgotPassword());
        break;
      case routeProfilePage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ProfilePage());
        break;
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => LoginPage(title: 'Login UI'));
    }
  }
}
