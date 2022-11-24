import 'package:flutter/material.dart';
import 'package:podcast_app/pages/choose_topic.dart';
import 'package:podcast_app/pages/splash_screen.dart';
import 'package:podcast_app/route/routes.dart';

class RoutePage{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splash:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      case Routes.chooseTopic:
        return MaterialPageRoute(builder: (_)=>const PageChooseTopic());
      default:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
    }
  }
}