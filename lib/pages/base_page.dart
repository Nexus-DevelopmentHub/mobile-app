import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/components/input_search.dart';
import 'package:podcast_app/components/navigasi_bar.dart';
import 'package:podcast_app/data/podcast_provider.dart';
import 'package:podcast_app/pages/detail_podcast.dart';
import 'package:podcast_app/pages/home.dart';
import 'package:podcast_app/pages/profile.dart';
import 'package:podcast_app/pages/search.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'detail_episode.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final s =  FirebaseAuth.instance.currentUser;
      print(s);
    });
    super.initState();
  }

  Widget buildAppBar(BuildContext context, bool innerBoxIsScrolled) {
    if (selected == 0) {
      return SliverAppBar(
        title: InputSearch(
            name: '',
            onChange: ((q) {
              context.read<PodcastProvider>().searchPodcast(q);
            }),
            placeholder: 'Find topics, podcaster, etc'),
        toolbarHeight: 72,
        forceElevated: innerBoxIsScrolled,
        backgroundColor: onNeutral,
        pinned: true,
      );
    }
    if (selected == 1) {
      return SliverPadding(
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
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
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
      );
    }
    if (selected == 2) {
      return SliverPadding(
        padding: EdgeInsets.only(left: 8, right: 8),
        sliver: SliverAppBar(
          leading: Icon(Icons.arrow_back),
          forceElevated: innerBoxIsScrolled,
          backgroundColor: onNeutral,
          pinned: true,
          actions: [Icon(Icons.more_vert_rounded)],
        ),
      );
    }

    if (selected == 3) {
      return SliverPadding(
        padding: EdgeInsets.only(left: 8, right: 8),
        sliver: SliverAppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              color: neutral,
              fontWeight: FontWeight.w800,
            ),
          ),
          leading: Icon(Icons.arrow_back),
          forceElevated: innerBoxIsScrolled,
          backgroundColor: onNeutral,
          pinned: true,
        ),
      );
    }

    return Container();
  }

  Widget buildScreen(BuildContext context) {
    if (selected == 0) {
      return const PageHome();
    }
    if (selected == 1) {
      return const PageSearch();
    }

    if (selected == 2) {
      return const PageDetailPodcast();
    }

    if (selected == 3) {
      return PageProfile();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: onNeutral,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [buildAppBar(context, innerBoxIsScrolled)],
          body: buildScreen(context)),
      bottomNavigationBar: NavigasiBar(
        selected: selected,
        onItemClicked: (index) {
          setState(() {
            selected = index;
          });
        },
      ),
    );
  }
}
