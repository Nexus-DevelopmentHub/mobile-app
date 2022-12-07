import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_listepisode.dart';
import 'package:podcast_app/components/chip_text.dart';
import 'package:podcast_app/components/header_detailpodcast.dart';
import 'package:podcast_app/data/episode_provider.dart';
import 'package:podcast_app/data/podcast_provider.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageDetailPodcast extends StatefulWidget {
  const PageDetailPodcast({Key? key}) : super(key: key);

  @override
  State<PageDetailPodcast> createState() => _PageDetailPodcastState();
}

class _PageDetailPodcastState extends State<PageDetailPodcast> {
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final routes =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      if (routes['id'] == null) {
        context.read<PodcastProvider>().getDetailPodcast(routes['id']!);
      }
    });
    super.initState();
  }

  var dataCategory = [
    "Berita",
    "Komedi",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: HeaderDetailPodcast(
              image: context.watch<PodcastProvider>().detailPodcast.thumbnail.toString(),
              name: 'Follow',
              description:
                  context.watch<PodcastProvider>().detailPodcast.description.toString(),
              artist: context.watch<PodcastProvider>().detailPodcast.createdBy.toString(),),
        ),
        SizedBox(
          height: 16,
        ),
        ListView(
          padding: EdgeInsets.only(right: 24, left: 24),
          primary: true,
          shrinkWrap: true,
          children: <Widget>[
            Wrap(
              spacing: 4.0,
              runSpacing: 8.0,
              children: List<Widget>.generate(dataCategory.length, (int index) {
                return ChipText(name: dataCategory[index], selected: false);
              }).toList(),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 14, top: 14, left: 24, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Episode",
                style: TextStyle(
                    color: neutral, fontSize: 16, fontWeight: FontWeight.w800),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_alt),
                color: neutral,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 24,
          ),
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                final data = context.watch<EpisodeProvider>().episodes[index];
                return ListEpisode(
                  totalIndex: context.watch<EpisodeProvider>().episodes.length,
                  index: index,
                  name: data.title.toString(),
                  artist: data.createdBy.toString(),
                  image: data.thumbnail.toString(),
                  onClick: () {
                    Navigator.of(context).pushNamed(Routes.detailDetailEpisode,
                        arguments: {'id': ""});
                  },
                );
              }),
        ),
      ],
    )));
  }
}
