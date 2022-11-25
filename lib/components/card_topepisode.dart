import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class TopEpisode extends StatefulWidget {
  const TopEpisode(
      {super.key,
      required this.name,
      required this.artist,
      required this.image});

  final String name;
  final String artist;
  final String image;

  @override
  State<TopEpisode> createState() => _TopEpisodeState();
}

class _TopEpisodeState extends State<TopEpisode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 249,
      height: 68,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 68,
              width: 68,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(image: NetworkImage(widget.image)),
              )),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 6, bottom: 6),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  color: neutral,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.artist,
                style: TextStyle(
                  color: subtitle,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
