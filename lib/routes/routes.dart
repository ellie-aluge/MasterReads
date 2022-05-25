import 'package:flutter/material.dart';
import 'package:masterreads/views/home/welcomePage.dart';
import 'package:masterreads/views/login/login_screen.dart';
import 'package:masterreads/views/signUp/register_screen.dart';
import 'package:masterreads/views/forgotPassword/forgot_password.dart';
import 'package:masterreads/views/user/books/bookDetail.dart';
import 'package:masterreads/views/user/books/bookList.dart';
import '../views/user/profilePage.dart';

class AppRoutes {
  static const String routeInitial = routeWelcome;

  static const String routeLogin = "/login";
  static const String routeSignUp = "/signup";
  static const String routeForgotPassword = "/forgotPassword";
  static const String routeWelcome = "/welcomePage";
  static const String routeProfilePage = "/profilePage";
  static const String routeBookDetail = "/bookDetail";
  static const String routeBookList = "/bookList";

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
      case routeBookDetail:
        return MaterialPageRoute(
            settings: settings, builder: (_) => BookDetail());
        break;
         case routeBookList:
        return MaterialPageRoute(
            settings: settings, builder: (_) => BookList());
        break;
      case routeWelcome:
        return MaterialPageRoute(
            settings: settings, builder: (_) => welcomePage());
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
            settings: settings, builder: (_) => welcomePage());
    }
  }
}
