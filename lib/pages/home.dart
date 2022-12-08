import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_audiobook.dart';
import 'package:podcast_app/components/card_continuelistening.dart';
import 'package:podcast_app/components/card_episode.dart';
import 'package:podcast_app/components/card_topepisode.dart';
import 'package:podcast_app/components/card_topics.dart';
import 'package:podcast_app/components/slider_banner.dart';
import 'package:podcast_app/data/episode_provider.dart';
import 'package:podcast_app/data/podcast_provider.dart';
import 'package:podcast_app/data/topic_provider.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TopicProvider>().getListTopics();
      context.read<EpisodeProvider>().getTopEpisodes();
      context.read<PodcastProvider>().getTrendingPodcast();
      context.read<PodcastProvider>().getListPodcastHome();
    });

    super.initState();
  }

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
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    bottom: 16, top: 16, left: 24, right: 24),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 28,
                      child: Column(
                        children: [
                          Text(
                            "For You",
                            style: TextStyle(
                                color: neutral,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 2,
                            width: 53,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(1)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 53,
                      height: 28,
                      child: Text(
                        "Podcast",
                        style: TextStyle(
                            color: subtitle,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 80,
                      height: 28,
                      child: Text(
                        "AudioBook",
                        style: TextStyle(
                            color: subtitle,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SliderBanner(onClick: ((p0) {})),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 8, left: 24, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Continue Listening",
                      style: TextStyle(
                          color: neutral,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                      color: neutral,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 165,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        context.watch<EpisodeProvider>().topEpisodes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data =
                          context.watch<EpisodeProvider>().topEpisodes[index];
                      return ContinueListening(
                        totalIndex: 10,
                        index: index,
                        image: data.thumbnail.toString(),
                        name: data.title.toString(),
                        percent: 0.6,
                        onClick: () {
                          Navigator.of(context).pushNamed(
                              Routes.detailEpisode,
                              arguments: {'id': data.id});
                        },
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 8, left: 24, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Topics",
                      style: TextStyle(
                          color: neutral,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                      color: neutral,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                  height: 95,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: context.watch<TopicProvider>().topics.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data =
                            context.watch<TopicProvider>().topics[index];
                        return CardTopics(
                            totalIndex: 10,
                            index: index,
                            name: data.name.toString(),
                            color: Colors.amber,
                            Image: "https://via.placeholder.com/150");
                      })),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 8, left: 24, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Episode Baru",
                      style: TextStyle(
                          color: neutral,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                      color: neutral,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                height: 205,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        context.watch<EpisodeProvider>().topEpisodes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data =
                          context.watch<EpisodeProvider>().topEpisodes[index];
                      return CardEpisode(
                        totalIndex: 10,
                        index: index,
                        name: data.title.toString(),
                        artist: data.createdBy.toString(),
                        image: data.thumbnail.toString(),
                        time: data.durationInSeconds.toString(),
                        onClick: () {
                          Navigator.of(context).pushNamed(
                              Routes.detailEpisode,
                              arguments: {'id': ""});
                        },
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 8, left: 24, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Episode",
                      style: TextStyle(
                          color: neutral,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                      color: neutral,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        context.watch<EpisodeProvider>().topEpisodes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data =
                          context.watch<EpisodeProvider>().topEpisodes[index];
                      return TopEpisode(
                        totalIndex: 5,
                        index: index,
                        name: data.title.toString(),
                        artist: data.createdBy.toString(),
                        episode: 'Episode 4',
                        image: data.thumbnail.toString(),
                        onClick: () {
                          Navigator.of(context).pushNamed(
                              Routes.detailEpisode,
                              arguments: {'id': ""});
                        },
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 8, left: 24, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Panduan Gapai Cita-Cita",
                      style: TextStyle(
                          color: neutral,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                      color: neutral,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 235,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context.watch<PodcastProvider>().podcasts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data =
                          context.watch<PodcastProvider>().podcasts[index];
                      return CardAudioBook(
                        totalIndex: 5,
                        index: index,
                        image: data.thumbnail.toString(),
                        name: data.title.toString(),
                        description: data.description.toString(),
                        onClick: () {
                          Navigator.of(context).pushNamed(Routes.detailPodcast,
                              arguments: {'id': data.id});
                        },
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
