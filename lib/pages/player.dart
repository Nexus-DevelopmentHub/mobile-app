import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/pages/header_player.dart';
import 'package:podcast_app/theme/theme.dart';

class PagePlayer extends StatefulWidget {
  const PagePlayer({super.key});

  @override
  State<PagePlayer> createState() => _PagePlayerState();
}

class _PagePlayerState extends State<PagePlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onNeutral,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: onNeutral,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            HeaderPlayer(
              createdBy: 'The Fahrul Show',
              title: 'Stories & Cities Jakarta Episode 2',
              thumbnail: 'thumbnail',
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
