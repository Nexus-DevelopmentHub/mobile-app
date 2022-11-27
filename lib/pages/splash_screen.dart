import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_continuelistening.dart';
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
          ContinueListening(
              image:
                  'hhttps://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Fshow%2F0QbSlvIXRaUtUmeajs99Cj&psig=AOvVaw27DU-JdS7eCUF0qCfjVFDr&ust=1669619471872000&source=images&cd=vfe&ved=2ahUKEwilpMKt5837AhVOUWwGHaCcB5kQjRx6BAgAEAo',
              name: 'Relaxing Mids episode 1',
              percent: 0.6)
        ],
      ),
    );
  }
}
