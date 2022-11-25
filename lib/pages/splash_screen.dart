import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_episode.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/theme/theme.dart';

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
         CardEpisode(name: 'Stories & Cities Jakarta', artist: 'The Fahrul Show', image: 'Mario', time: '1 Hour, 5 min')
        ],
      ),
    );
  }
}