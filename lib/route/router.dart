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
      case Routes.detailDetailEpisode:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      case Routes.listEpisode:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      case Routes.detailPodcast:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      case Routes.detailPlayer:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
      default:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
    }
  }
}