import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:podcast_app/theme/theme.dart';

class SliderPlayer extends StatefulWidget {
  const SliderPlayer({
    super.key,
    this.onReplay,
    this.onNext,
  });

  final VoidCallback? onReplay;
  final VoidCallback? onNext;

  @override
  State<SliderPlayer> createState() => _SliderPlayerState();
}

class _SliderPlayerState extends State<SliderPlayer> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProgressBar(
            baseBarColor: Colors.white.withOpacity(0.24),
            progressBarColor: primary,
            thumbColor: neutral,
            bufferedBarColor: Colors.white.withOpacity(0.24),
            barHeight: 5.0,
            thumbGlowColor: primary,
            progress: Duration(milliseconds: 1000),
            buffered: Duration(milliseconds: 1000),
            total: Duration(milliseconds: 1000),
            timeLabelLocation: TimeLabelLocation.below,
            timeLabelPadding: 8.0,
            timeLabelTextStyle: TextStyle(
              color: neutral,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            onSeek: (duration) {},
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 56,
                width: 56,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.replay_10_rounded,
                    color: neutral,
                    size: 24,
                  ),
                ),
              ),
              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80), color: primary),
                child: IconButton(
                  icon: Icon(
                    (isPlaying) ? Icons.stop : Icons.play_arrow_rounded,
                    color: neutral,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
              ),
              Container(
                height: 56,
                width: 56,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.forward_10_rounded,
                    color: neutral,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
