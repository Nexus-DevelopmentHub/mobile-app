import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_recentsearch.dart';
import 'package:podcast_app/components/chip_text.dart';
import 'package:podcast_app/data/topic_provider.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

import '../data/podcast_provider.dart';

class PageSearch extends StatefulWidget {
  const PageSearch({Key? key}) : super(key: key);

  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  var filter = ["Berita", "Anak", "Komedi", "Motivasi", "Budaya", "Film TV"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    context.watch<PodcastProvider>().searchPodcastState.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = context
                      .watch<PodcastProvider>()
                      .searchPodcastState[index];

                  return Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? 24 : 8,
                        right: (index == 6 - 1) ? 24 : 0),
                    child: ChipText(
                      name: filter[index],
                      selected: index == 2,
                    ),
                  );
                }),
          ),
          Container(
            height: 400,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount:
                    context.watch<PodcastProvider>().searchPodcastState.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: (EdgeInsets.only(
                        top: (index == 0) ? 16 : 8,
                        bottom: (index == 6 - 1) ? 16 : 0,
                        left: 24,
                        right: 24)),
                    child: RecentSearch(
                        name: 'Stories & Cities Jakarta',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU'),
                  );
                }),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Clear Recent Source',
                      style: TextStyle(
                          color: neutral,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
