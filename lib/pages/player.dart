import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/components/slider_player.dart';
import 'package:podcast_app/pages/header_player.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class PagePlayer extends StatefulWidget {
  const PagePlayer({
    super.key,
  });

  @override
  State<PagePlayer> createState() => _PagePlayerState();
}

class _PagePlayerState extends State<PagePlayer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: HeaderPlayer(
              createdBy: 'The Fahrul Show',
              title: 'Stories & Cities Jakarta Episode 2',
              thumbnail: 'thumbnail',
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: SliderPlayer(),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'lib/icons/conect.png',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Connect Device',
                        style: TextStyle(
                          color: primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: neutral,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.airplay_rounded,
                    color: neutral,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
