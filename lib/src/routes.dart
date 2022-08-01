import 'package:chatbot_flutter/src/screens/landing.dart';
import 'package:chatbot_flutter/src/screens/login.dart';
import 'package:chatbot_flutter/src/screens/not_found.dart';
import 'package:chatbot_flutter/src/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  final BuildContext ctx;
  Routes({required this.ctx});
  //Seems to be working universallly
  PageTransition transitionRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return PageTransition(
            child: const Landing(),
            type: PageTransitionType.leftToRight,
            inheritTheme: true,
            settings: RouteSettings(name: "/"),
            ctx: ctx);
      case "/register":
        return PageTransition(
            child: const Register(),
            type: PageTransitionType.leftToRight,
            inheritTheme: true,
            settings: RouteSettings(name: "/register"),
            ctx: ctx);
      case "/login":
        return PageTransition(
            child: const Login(),
            type: PageTransitionType.leftToRight,
            settings: RouteSettings(name: "/login"),
            inheritTheme: true,
            ctx: ctx);
      default:
        var routeArray = [];
        if (settings.name != null) {
          routeArray = settings.name!.split('/');
        } else {
          print("ROUTE NOT FOUND");
          throw "ROUTE NOT FOUND ERROR";
        }
        return PageTransition(
            child: const NotFound(),
            type: PageTransitionType.leftToRight,
            inheritTheme: true,
            ctx: ctx);
    }
  }
}
