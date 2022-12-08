import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/components/slider_player.dart';
import 'package:podcast_app/data/episode_provider.dart';
import 'package:podcast_app/pages/header_player.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PagePlayer extends StatefulWidget {
  const PagePlayer({Key? key,this.settings}) : super(key: key);
  final RouteSettings? settings;

  @override
  State<PagePlayer> createState() => _PagePlayerState();
}

class _PagePlayerState extends State<PagePlayer> {
  AudioPlayer player = AudioPlayer();
  bool isPlay=false;
  Duration totalDuration=Duration();
  Duration currentPosition=Duration();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.settings?.arguments != null) {
        final id = widget.settings!.arguments as Map<String, String>;
        if (id['id'] != null) {
          context.read<EpisodeProvider>().getDetailEpisode(id['id']!);
        }
      }

    });
    player.onDurationChanged.listen((event) {
      totalDuration = event;
    });
    player.onPositionChanged.listen((event) {
      currentPosition = event;
    });


    super.initState();
  }

  @override
  void dispose() {
    if(isPlay) {
      stop();
    }
    super.dispose();
  }

  void play(String url) async{
    if(isPlay){
      pause();
      isPlay=false;
      return;
    }
    final source = UrlSource(url);
    await player.play(source);
    isPlay=true;
  }
  void stop() async{
    await player.stop();
  }

  void pause() async{
    await player.pause();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: onNeutral,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              sliver: SliverAppBar(
                leading: const Icon(Icons.arrow_back),
                forceElevated: innerBoxIsScrolled,
                backgroundColor: onNeutral,
                pinned: true,
                actions: const [Icon(Icons.more_vert_rounded)],
              ),
            )
          ],
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24, right: 24),
                  child: HeaderPlayer(
                    createdBy: context.watch<EpisodeProvider>().ownerPodcast.name.toString(),
                    title: context.watch<EpisodeProvider>().detailEpisode.title.toString(),
                    thumbnail: context.watch<EpisodeProvider>().detailEpisode.thumbnail.toString(),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16
                  ),
                  child:  ProgressBar(
                    baseBarColor: Colors.white.withOpacity(0.24),
                    progressBarColor: primary,
                    thumbColor: neutral,
                    bufferedBarColor: Colors.white.withOpacity(0.24),
                    barHeight: 5.0,
                    thumbGlowColor: primary,
                    progress: currentPosition,
                    total:  totalDuration,
                    buffered: currentPosition,
                    timeLabelLocation: TimeLabelLocation.below,
                    timeLabelPadding: 8.0,
                    timeLabelTextStyle: TextStyle(
                      color: neutral,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    onSeek: (duration) {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24, right: 24),
                  child: SliderPlayer(
                    duration: totalDuration,
                    current: currentPosition,
                    onPause: (){
                      var url = context.read<EpisodeProvider>().detailEpisode.audioUrl.toString();
                      play(url);
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            const SizedBox(
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
          ),
        ));
  }
}
