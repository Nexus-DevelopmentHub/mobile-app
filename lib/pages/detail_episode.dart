import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_listepisode.dart';
import 'package:podcast_app/components/header_detailepisode.dart';
import 'package:podcast_app/components/input_ctadetailepisode.dart';
import 'package:podcast_app/data/episode_provider.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageDetailEpisode extends StatefulWidget {
  const PageDetailEpisode({Key? key, this.settings}) : super(key: key);
  final RouteSettings? settings;

  @override
  State<PageDetailEpisode> createState() => _PageDetailEpisodeState();
}

class _PageDetailEpisodeState extends State<PageDetailEpisode> {
  final title = 2;

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
    super.initState();
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
                  Container(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: context.watch<EpisodeProvider>().detailEpisode.thumbnail != null ?  HeaderDetailEpisode(
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
                          .ownerPodcast
                          .name
                          .toString(),
                      description: context
                          .watch<EpisodeProvider>()
                          .detailEpisode
                          .description
                          .toString(),
                      percent: 0,
                      onClick: (() {
                        // Download Episode
                      }),
                    ) : Container(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 16
                    ),
                    child: CtaDetailEpisode(
                      name: 'Play',
                      onClick: () {
                        // Rute Player
                        final id = widget.settings?.arguments as Map<String,String>;
                        Navigator.of(context).pushNamed(Routes.detailPlayer,arguments: {
                          'id': id['id']
                        });
                      },
                      onShareClick: () {
                        // Share Episode
                      },
                      onLikeClick: () {
                        // Like Episode
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 24, right: 24),
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
                        itemCount:
                            context.watch<EpisodeProvider>().episodes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = context
                              .watch<EpisodeProvider>()
                              .episodes[index];
                          return ListEpisode(
                            totalIndex: 50,
                            index: index,
                            name: data.title.toString(),
                            artist: data.createdBy.toString(),
                            image: data.thumbnail.toString(),
                            onClick: () {
                              Navigator.of(context).pushNamed(
                                  Routes.detailEpisode,
                                  arguments: {'id': ""});
                            },
                          );
                        }),
                  ),
                ],
              ),
            )));
  }
}
