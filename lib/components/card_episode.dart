import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class CardEpisode extends StatefulWidget {
  const CardEpisode(
      {super.key,
      required this.name,
      required this.artist,
      required this.image,
      required this.time,
      required this.index,
      required this.totalIndex,
      required this.onClick});
  final int totalIndex;
  final int index;
  final String name;
  final String artist;
  final String image;
  final String time;
  final VoidCallback onClick;

  @override
  State<CardEpisode> createState() => _CardEpisodeState();
}

class _CardEpisodeState extends State<CardEpisode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: (widget.index == 0) ? 24 : 8,
          right: (widget.index == widget.totalIndex - 1) ? 24 : 0),
      width: 120,
      height: 218,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: NetworkImage(widget.image),
                )),
          ),
          SizedBox(height: 8),
          Container(
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: neutral,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.artist,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: subtitle,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.time,
                  style: TextStyle(
                    color: subtitle,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
