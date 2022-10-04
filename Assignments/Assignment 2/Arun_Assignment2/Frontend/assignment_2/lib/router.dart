import 'package:assignment_2/pages/logged_in.dart';
import 'package:assignment_2/pages/login.dart';
import 'package:assignment_2/pages/update_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class RouteManager{
  static const String logIn = '/';
  static const String loggedIn = '/loggedIn';
  static const String update = '/update';
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case logIn:
        return PageTransition(
          child: const LogIn(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 350),
        );
      case loggedIn:
        var args=settings.arguments as Map<String,String>;
        return PageTransition(
          child: LoggedIn(email: args["email"]! ,pwd: args["password"]!),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 350),
        );
      case update:
        var args=settings.arguments as Map<String,String>;
        return PageTransition(
          child: Update(oldEmail: args["oldEmail"]! ,oldPassword: args["oldPassword"]!),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 350),
        );
      default:
        throw const FormatException("Route Not found!! Check Routes again");
    }
  }
}