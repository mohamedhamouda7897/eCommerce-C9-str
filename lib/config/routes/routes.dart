import 'package:e_commerce/features/home/presentation/pages/home.dart';
import 'package:e_commerce/features/login/presentation/pages/login_screen.dart';
import 'package:e_commerce/features/signup/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/signup/presentation/pages/signup_screen.dart';

class AppRoutesName {
  static const String login = "login";
  static const String signUp = "/";
  static const String home = "Home";

}

class AppRoute {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case AppRoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case AppRoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() => Scaffold(
        appBar: AppBar(
          title: Text("UndDefine"),
        ),
        body: Text("Sorry, UnDefine Route"),
      );
}
