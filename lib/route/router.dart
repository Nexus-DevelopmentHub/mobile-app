import 'package:flutter/material.dart';
import 'package:podcast_app/pages/choose_topic.dart';
import 'package:podcast_app/pages/complete_profile.dart';
import 'package:podcast_app/pages/detail_episode.dart';
import 'package:podcast_app/pages/detail_player.dart';
import 'package:podcast_app/pages/detail_podcast.dart';
import 'package:podcast_app/pages/home.dart';
import 'package:podcast_app/pages/list_episode.dart';
import 'package:podcast_app/pages/search.dart';
import 'package:podcast_app/pages/sign_in.dart';
import 'package:podcast_app/pages/sign_up.dart';
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
        return MaterialPageRoute(builder: (_)=>const PageDetailEpisode());
      case Routes.listEpisode:
        return MaterialPageRoute(builder: (_)=>const PageListEpisode());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_)=>const PageSignIn());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_)=>const PageSignUp());
      case Routes.home:
        return MaterialPageRoute(builder: (_)=>const PageHome());
      case Routes.search:
        return MaterialPageRoute(builder: (_)=>const PageSearch());
      case Routes.detailPodcast:
        return MaterialPageRoute(builder: (_)=>const PageDetailPodcast());
      case Routes.detailPlayer:
        return MaterialPageRoute(builder: (_)=>const PageDetailPlayer());
      case Routes.completeProfile:
        return MaterialPageRoute(builder: (_)=>const PageCompleteProfile());
      default:
        return MaterialPageRoute(builder: (_)=>const PageSplashScreen());
    }
  }
}