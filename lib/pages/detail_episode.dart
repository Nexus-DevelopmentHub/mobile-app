import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_listepisode.dart';
import 'package:podcast_app/components/header_detailepisode.dart';
import 'package:podcast_app/components/input_ctadetailepisode.dart';
import 'package:podcast_app/data/episode_provider.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageDetailEpisode extends StatefulWidget {
  const PageDetailEpisode({Key? key}) : super(key: key);

  @override
  State<PageDetailEpisode> createState() => _PageDetailEpisodeState();
}

class _PageDetailEpisodeState extends State<PageDetailEpisode> {
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
              child: const HeaderDetailEpisode(
                  name: 'Stories & Cities Jakarta',
                  image:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                  artist: 'The Fahrul Show',
                  description:
                      'Conversations about science. tech, history, philosophu, and nature intellegence',
                  percent: 0.6),
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
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return ListEpisode(
                      totalIndex: 50,
                      index: index,
                      name: 'Stories & Cities Jakarta',
                      artist: 'The Fahrul Show',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
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
