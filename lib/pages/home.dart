import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_audiobook.dart';
import 'package:podcast_app/components/card_continuelistening.dart';
import 'package:podcast_app/components/card_episode.dart';
import 'package:podcast_app/components/card_topepisode.dart';
import 'package:podcast_app/components/card_topics.dart';
import 'package:podcast_app/components/slider_banner.dart';
import 'package:podcast_app/data/episode_provider.dart';
import 'package:podcast_app/data/podcast_provider.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';
import '../data/topic_provider.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<EpisodeProvider>().getTopEpisodes();
      context.read<TopicProvider>().getListTopics();
      context.read<EpisodeProvider>().getTopEpisodes();
      context.read<PodcastProvider>().getTrendingPodcast();
      context.read<EpisodeProvider>().getTopEpisodes();
    });

    super.initState();
  }

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
                    Container(
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
                      icon: Icon(Icons.chevron_right_rounded),
                      color: neutral,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 160,
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
                          //
                          percent: 0.6);
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
                      icon: Icon(Icons.chevron_right_rounded),
                      color: neutral,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context.watch<TopicProvider>().topics.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = context.watch<TopicProvider>().topics[index];
                      return CardTopics(
                          totalIndex: 10,
                          index: index,
                          name: data.name.toString(),
                          color: HexColor.fromHex(data.color.toString()),
                          Image: data.image.toString());
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
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context.watch<EpisodeProvider>().episodes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data =
                          context.watch<EpisodeProvider>().episodes[index];
                      return CardEpisode(
                          totalIndex: 10,
                          index: index,
                          name: data.title.toString(),
                          artist: data.createdBy.toString(),
                          image: data.thumbnail.toString(),
                          time: data.durationInSeconds.toString());
                    }),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8, top: 8, left: 24, right: 8),
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
                height: 65,
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
                          image: data.thumbnail.toString());
                    }),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8, top: 8, left: 24, right: 8),
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
                      icon: Icon(Icons.chevron_right_rounded),
                      color: neutral,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 230,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return CardAudioBook(
                          totalIndex: 5,
                          index: index,
                          image:
                              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/yellow-business-leadership-book-cover-design-template-dce2f5568638ad4643ccb9e725e5d6ff.jpg?ts=1637017516',
                          name: 'The Mean Of A Leader',
                          description: 'Seorang pemimpin...');
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
