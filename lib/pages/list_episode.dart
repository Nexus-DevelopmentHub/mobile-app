import 'package:flutter/material.dart';
import 'package:podcast_app/card_episodelarge.dart';
import 'package:podcast_app/components/card_episode.dart';
import '../components/input_search.dart';
import '../theme/theme.dart';

class PageListEpisode extends StatefulWidget {
  const PageListEpisode({Key? key}) : super(key: key);

  @override
  State<PageListEpisode> createState() => _PageListEpisodeState();
}

class _PageListEpisodeState extends State<PageListEpisode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: onNeutral,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPadding(
            padding: EdgeInsets.only(
              left: 4,
              right: 8,
            ),
            sliver: SliverAppBar(
              leading: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    height: 40,
                    width: 40,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  )
                ],
              ),
              title: InputSearch(
                  name: '',
                  onChange: ((p0) {}),
                  placeholder: 'Find topics, podcaster, etc'),
              toolbarHeight: 72,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: onNeutral,
              pinned: true,
            ),
          ),
        ],
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          padding: EdgeInsets.only(left: 8,right: 8),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              height: 100,
              child: CardEpisodeLarge(
                  name: 'Stories & Cities Jakarta',
                  artist: 'The Fahrul Show',
                  image:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                  time: '1 Hour, 5 Min'),
            );
          },
        ),
      ),
    );
  }
}