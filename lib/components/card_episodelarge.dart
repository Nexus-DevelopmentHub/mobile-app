import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class CardEpisodeLarge extends StatefulWidget {
  const CardEpisodeLarge(
      {super.key,
      required this.name,
      required this.artist,
      required this.image,
      required this.time});

  final String name;
  final String artist;
  final String image;
  final String time;

  @override
  State<CardEpisodeLarge> createState() => _CardEpisodeLargeState();
}

class _CardEpisodeLargeState extends State<CardEpisodeLarge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 156,
            height: 156,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: NetworkImage(widget.image),
                )),
          ),
          Container(
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: neutral,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.artist,
                  style: TextStyle(
                    color: subtitle,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.time,
                  style: TextStyle(
                    color: subtitle,
                    fontSize: 12,
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