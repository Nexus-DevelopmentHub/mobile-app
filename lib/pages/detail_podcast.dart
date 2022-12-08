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
  const PageDetailPodcast({Key? key,required this.settings}) : super(key: key);
  final RouteSettings? settings;

  @override
  State<PageDetailPodcast> createState() => _PageDetailPodcastState();
}

class _PageDetailPodcastState extends State<PageDetailPodcast> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(widget.settings?.arguments != null) {
        final id = widget.settings!.arguments as Map<String, String>;
        if (id['id'] != null) {
          context.read<PodcastProvider>().getDetailPodcast(id['id']!);
          context.read<EpisodeProvider>().getListEpisodeByPodcast(id['id']!);
        }
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

              context.watch<PodcastProvider>().detailPodcast != null ?
                Container(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: HeaderDetailPodcast(
                    image: context
                        .watch<PodcastProvider>()
                        .detailPodcast
                        .thumbnail
                        .toString(),
                    name: 'Follow',
                    description: context
                        .watch<PodcastProvider>()
                        .detailPodcast
                        .description
                        .toString(),
                    artist: context
                        .watch<PodcastProvider>()
                        .ownerPodcast
                        .name
                        .toString(),
                  ),
                ) : Container(),
              const SizedBox(
                height: 16,
              ),
              ListView(
                padding: const EdgeInsets.only(right: 24, left: 24),
                primary: true,
                shrinkWrap: true,
                children: <Widget>[
              Wrap(
                spacing: 4.0,
                runSpacing: 8.0,
                children:
                    List<Widget>.generate(dataCategory.length, (int index) {
                  return ChipText(
                      name: dataCategory[index], selected: false);
                }).toList(),
              ),
                ],
              ),
              Container(
                padding:
                const EdgeInsets.only(bottom: 14, top: 14, left: 24, right: 8),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Episode",
                  style: TextStyle(
                      color: neutral,
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt),
                  color: neutral,
                ),
              ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
              left: 24,
                ),
                height: 300,
                child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: context.watch<EpisodeProvider>().episodes.length,
                itemBuilder: (BuildContext context, int index) {
                  final data =
                      context.watch<EpisodeProvider>().episodes[index];
                  return ListEpisode(
                    totalIndex:
                        context.watch<EpisodeProvider>().episodes.length,
                    index: index,
                    name: data.title.toString(),
                    artist: context.watch<PodcastProvider>().ownerPodcast.name.toString(),
                    image: data.thumbnail.toString(),
                    onClick: () {
                      Navigator.of(context).pushNamed(
                          Routes.detailEpisode,
                          arguments: {'id': data.id});
                    },
                  );
                }),
              ),
            ],
          ))),
    );
  }
}
