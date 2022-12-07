import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_listepisode.dart';
import 'package:podcast_app/components/header_detailepisode.dart';
import 'package:podcast_app/components/input_ctadetailepisode.dart';
import 'package:podcast_app/data/episode_provider.dart';
import 'package:podcast_app/data/podcast_provider.dart';
import 'package:podcast_app/models/episode_model.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageDetailEpisode extends StatefulWidget {
  const PageDetailEpisode({Key? key}) : super(key: key);

  @override
  State<PageDetailEpisode> createState() => _PageDetailEpisodeState();
}

class _PageDetailEpisodeState extends State<PageDetailEpisode> {
  final title = 2;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final routes =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      if (routes['id'] == null) {
        context.read<EpisodeProvider>().getDetailEpisode(routes['id']!);
      }
    });
    super.initState();
  }

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
              child: HeaderDetailEpisode(
                name: context
                    .watch<EpisodeProvider>()
                    .detailEpisode
                    .title
                    .toString(),
                image: context
                    .watch<EpisodeProvider>()
                    .detailEpisode
                    .thumbnail
                    .toString(),
                artist: context
                    .watch<EpisodeProvider>()
                    .detailEpisode
                    .createdBy
                    .toString(),
                description: context
                    .watch<EpisodeProvider>()
                    .detailEpisode
                    .description
                    .toString(),
                percent: context
                    .watch<EpisodeProvider>()
                    .detailEpisode
                    .durationInSeconds!
                    .toDouble(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: CtaDetailEpisode(name: 'Mario ganteng'),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'See all episode',
                    style: TextStyle(
                        fontSize: 14,
                        color: neutral,
                        fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: neutral,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              height: 326,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: context.watch<EpisodeProvider>().episodes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data =
                        context.watch<EpisodeProvider>().episodes[index];
                    return ListEpisode(
                      totalIndex: 50,
                      index: index,
                      name: data.title.toString(),
                      artist: data.createdBy.toString(),
                      image: data.thumbnail.toString(),
                      onClick: () {
                        Navigator.of(context).pushNamed(
                            Routes.detailDetailEpisode,
                            arguments: {'id': ""});
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
