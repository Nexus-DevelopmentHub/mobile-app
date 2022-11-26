import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_episode.dart';
import 'package:podcast_app/components/card_topepisode.dart';
import 'package:podcast_app/components/header_detailepisode.dart';
import 'package:podcast_app/components/header_detailpodcast.dart';
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
          HeaderDetailEpisode(
              name: "3 Things you shoud know about NFT",
              image:
                  "https://thumbs.dreamstime.com/b/template-social-media-banner-podcast-sunday-vector-promotion-elegant-charming-appearance-suitable-promoting-your-197926266.jpg",
              artist: "Joe Mama Podcast",
              value: '',
              placeholder: 'Conversations about science. tech, history, philosophu, and nature intellegence')
          //cobain componentnya disini
        ],
      ),
    );
  }
}
