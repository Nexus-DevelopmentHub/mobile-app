import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_episode.dart';
import 'package:podcast_app/components/card_listepisode.dart';
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
          ListEpisode(
              name: 'Tech talk episode: Metaverse',
              artist: 'fahrul',
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQliXjC4vzVLAfH721TX1kz_ZJfOI-xi77bMA&usqp=CAU')
        ],
      ),
    );
  }
}
