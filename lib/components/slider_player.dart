import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:podcast_app/theme/theme.dart';

class SliderPlayer extends StatefulWidget {
  SliderPlayer({
    super.key,
    this.onReplay,
    this.onNext,
    this.onPause,
    this.duration=const Duration(),
    this.current=const Duration()
  });

  final VoidCallback? onReplay;
  final VoidCallback? onNext;
  final VoidCallback? onPause;
   Duration duration=Duration();
   Duration current=Duration();

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

          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
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
                    widget.onPause!();
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
