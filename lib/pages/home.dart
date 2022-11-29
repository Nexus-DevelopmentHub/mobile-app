import 'package:flutter/material.dart';
import 'package:podcast_app/components/card_audiobook.dart';
import 'package:podcast_app/components/card_continuelistening.dart';
import 'package:podcast_app/components/card_episode.dart';
import 'package:podcast_app/components/card_topepisode.dart';
import 'package:podcast_app/components/card_topics.dart';
import 'package:podcast_app/components/input_search.dart';
import 'package:podcast_app/components/slider_banner.dart';
import 'package:podcast_app/theme/theme.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: onNeutral,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: InputSearch(
                  name: '',
                  onChange: ((p0) {}),
                  placeholder: 'Find topics, podcaster, etc'),
              toolbarHeight: 72,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: onNeutral,
              pinned: true,
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
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
                                SizedBox(
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
                          SizedBox(
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
                          SizedBox(
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
                      padding: EdgeInsets.only(
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
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 160,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return ContinueListening(
                                totalIndex: 10,
                                index: index,
                                image:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                                name: 'Relaxing Mids episod...',
                                percent: 0.6);
                          }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.only(
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
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 90,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return CardTopics(
                                totalIndex: 10,
                                index: index,
                                name: 'Cinta',
                                color: Colors.pink,
                                Image:
                                    'https://cdn-icons-png.flaticon.com/512/2904/2904973.png');
                          }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.only(
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
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return CardEpisode(
                                totalIndex: 10,
                                index: index,
                                name: 'Stories & Cities Jakarta',
                                artist: 'The Fahrul Show',
                                image:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                                time: '1 Hour, 5 Min');
                          }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.only(
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
                      height: 65,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return TopEpisode(
                                totalIndex: 5,
                                index: index,
                                name: 'Stories & Cities Jakarta',
                                artist: 'The fahrul Show',
                                episode: 'Episode 4',
                                image:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU');
                          }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.only(
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
          ),
        ));
  }
}
