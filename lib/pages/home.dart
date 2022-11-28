import 'package:flutter/material.dart';
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
      backgroundColor: onNeutral,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputSearch(
                name: '',
                onChange: ((p0) {}),
                placeholder: 'Find topics, podcaster, etc'),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 16, top: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 53,
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
                  padding: EdgeInsets.only(bottom: 8, top: 8),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContinueListening(
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                          name: 'Relaxing Mids episod...',
                          percent: 0.6),
                      SizedBox(
                        width: 8,
                      ),
                      ContinueListening(
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                          name: 'Relaxing Mids episod...',
                          percent: 0.6),
                      SizedBox(
                        width: 8,
                      ),
                      ContinueListening(
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                          name: 'Relaxing Mids episod...',
                          percent: 0.6),
                      SizedBox(
                        width: 8,
                      ),
                      ContinueListening(
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                          name: 'Relaxing Mids episod...',
                          percent: 0.6),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8, top: 8),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardTopics(
                          name: "Cinta",
                          color: Colors.pink,
                          Image:
                              "https://cdn-icons-png.flaticon.com/512/2904/2904973.png"),
                      SizedBox(
                        width: 8,
                      ),
                      CardTopics(
                          name: "Cinta",
                          color: Colors.purple,
                          Image:
                              "https://cdn-icons-png.flaticon.com/512/2904/2904973.png"),
                      SizedBox(
                        width: 8,
                      ),
                      CardTopics(
                          name: "Cinta",
                          color: Colors.blue,
                          Image:
                              "https://cdn-icons-png.flaticon.com/512/2904/2904973.png"),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8, top: 8),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardEpisode(
                          name: 'Stories & Cities Jakarta',
                          artist: 'The Fahrul Show',
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                          time: '1 Hour, 5 Min'),
                      SizedBox(
                        width: 8,
                      ),
                      CardEpisode(
                          name: 'Stories & Cities Jakarta',
                          artist: 'The Fahrul Show',
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                          time: '1 Hour, 5 Min'),
                      SizedBox(
                        width: 8,
                      ),
                      CardEpisode(
                          name: 'Stories & Cities Jakarta',
                          artist: 'The Fahrul Show',
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                          time: '1 Hour, 5 Min'),
                      SizedBox(
                        width: 8,
                      ),
                      CardEpisode(
                          name: 'Stories & Cities Jakarta',
                          artist: 'The Fahrul Show',
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                          time: '1 Hour, 5 Min'),
                    ],
                  ),
                ),
                Container(
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
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TopEpisode(
                              name: 'Eps 4: Stories & Cities Jakarta',
                              artist: 'The fahrul Show',
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TopEpisode(
                              name: 'Eps 4: Stories & Cities Jakarta',
                              artist: 'The fahrul Show',
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TopEpisode(
                              name: 'Eps 4: Stories & Cities Jakarta',
                              artist: 'The fahrul Show',
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TopEpisode(
                              name: 'Eps 4: Stories & Cities Jakarta',
                              artist: 'The fahrul Show',
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TopEpisode(
                              name: 'Eps 4: Stories & Cities Jakarta',
                              artist: 'The fahrul Show',
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TopEpisode(
                              name: 'Eps 4: Stories & Cities Jakarta',
                              artist: 'The fahrul Show',
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TopEpisode(
                              name: 'Eps 4: Stories & Cities Jakarta',
                              artist: 'The fahrul Show',
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TopEpisode(
                              name: 'Eps 4: Stories & Cities Jakarta',
                              artist: 'The fahrul Show',
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
