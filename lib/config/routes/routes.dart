import 'package:ecommerce_c9_str/features/home/presentation/pages/home.dart';
import 'package:ecommerce_c9_str/features/login/presentation/pages/login_screen.dart';
import 'package:ecommerce_c9_str/features/signup/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../features/product_details/presentation/pages/product_details.dart';

class AppRoutesName {
  static const String login = "/";
  static const String signUp = "singup";
  static const String home = "Home";
  static const String productDetails = "productDetails";
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
      case AppRoutesName.productDetails:
        return MaterialPageRoute(
          builder: (context) => ProductDetails(),
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
