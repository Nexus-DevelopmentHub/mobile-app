import 'package:flutter/material.dart';
import 'package:podcast_app/pages/splash_screen.dart';
import 'package:podcast_app/route/routes.dart';

class RoutePage{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splash:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
    }
  }
}