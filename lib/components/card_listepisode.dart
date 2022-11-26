import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme/theme.dart';

class ListEpisode extends StatefulWidget {
  const ListEpisode(
      {super.key,
      required this.name,
      required this.artist,
      required this.image,
      this.onClick});

  final String name;
  final String artist;
  final String image;
  final VoidCallback? onClick;

  @override
  State<ListEpisode> createState() => _ListEpisodeState();
}

class _ListEpisodeState extends State<ListEpisode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(image: NetworkImage(widget.image)),
              )),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 14,
                  bottom: 14,
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  color: neutral,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.artist,
                style: TextStyle(
                  color: subtitle,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              color: neutral,
              onPressed: () {
                widget?.onClick?.call();
              },
              icon: Icon(Icons.download_rounded)),
        ],
      ),
    );
  }
}
