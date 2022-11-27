import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:podcast_app/components/card_episode.dart';
import 'package:podcast_app/components/card_topepisode.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/components/slider_banner.dart';
import 'package:podcast_app/theme/theme.dart';
import '../components/input_gender.dart';


class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  State<PageSplashScreen> createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onNeutral,
      body: Column(
        children: [
          //cobain componentnya disini
          SliderBanner(
            onClick: (value){
              
            },
          )
        ],
      ),
    );
  }
}
