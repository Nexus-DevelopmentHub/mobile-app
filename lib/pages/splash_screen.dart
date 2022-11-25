import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_episode.dart';
import 'package:podcast_app/components/card_topepisode.dart';
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
          TopEpisode(name: 'Stories & Cities Jakarta', artist: 'Media Production', image: 'https://yt3.ggpht.com/ytc/AMLnZu9PNHmf0ltJ2Rx4xY6Px-6osvSDbnmhR6S3t7LF=s900-c-k-c0x00ffffff-no-rj')
        ],
      ),
    );
  }
}
