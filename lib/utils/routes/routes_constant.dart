import 'package:e_commerce_advance/utils/routes/route_name.dart';
import 'package:e_commerce_advance/view/auth/login_page.dart';
import 'package:e_commerce_advance/view/description.dart';
import 'package:e_commerce_advance/view/splash.dart';
import 'package:flutter/material.dart';

import '../../view/navbar/bottom_navigation.dart';

class RouteClass {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.navBar:
        return MaterialPageRoute(builder: (context) => const BottomNavigationPage());
         case RouteConstant.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
          case RouteConstant.splashPage:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteConstant.descriptionPage:
        return MaterialPageRoute(builder: (context) => DescriptionPage(
         id: settings.arguments as int,
        ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Text('Route not found'));
    }
  }
}
