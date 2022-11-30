import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_listepisode.dart';
import 'package:podcast_app/components/chip_text.dart';
import 'package:podcast_app/components/header_detailpodcast.dart';
import 'package:podcast_app/theme/theme.dart';

class PageDetailPodcast extends StatefulWidget {
  const PageDetailPodcast({Key? key}) : super(key: key);

  @override
  State<PageDetailPodcast> createState() => _PageDetailPodcastState();
}

class _PageDetailPodcastState extends State<PageDetailPodcast> {
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
            padding: EdgeInsets.only(left: 8, right: 8),
            sliver: SliverAppBar(
              leading: Icon(Icons.arrow_back),
              forceElevated: innerBoxIsScrolled,
              backgroundColor: onNeutral,
              pinned: true,
              actions: [Icon(Icons.more_vert_rounded)],
            ),
          ),
        ],
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: HeaderDetailPodcast(
                  image:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                  name: 'Follow',
                  description:
                      'Conversations about science. tech, history, philosophu, and nature intellegence',
                  artist: 'The Fahrul Show'),
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
                  children:
                      List<Widget>.generate(dataCategory.length, (int index) {
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
                        color: neutral,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
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
              padding: EdgeInsets.only(left: 24,),
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListEpisode(
                        totalIndex: 10,
                        index: index,
                        name: 'Stories & Cities Jakarta',
                        artist: 'The Fahrul Show',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU');
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
