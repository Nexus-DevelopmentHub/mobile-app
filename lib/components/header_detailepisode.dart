import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class HeaderDetailEpisode extends StatefulWidget {
  const HeaderDetailEpisode(
      {super.key,
      required this.name,
      required this.image,
      required this.artist,
      required this.description,
      this.onClick,
      required this.percent});

  final String name;
  final String image;
  final String artist;
  final String description;
  final VoidCallback? onClick;
  final double percent;

  @override
  State<HeaderDetailEpisode> createState() => _HeaderDetailEpisodeState();
}

class _HeaderDetailEpisodeState extends State<HeaderDetailEpisode> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 161,
              width: 161,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(widget.image),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.onClick;
                });
              },
              iconSize: 36,
              icon: Icon(Icons.downloading_rounded),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              color: neutral,
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 8,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: LinearPercentIndicator(
                width: 160,
                lineHeight: 8,
                barRadius: Radius.circular(8),
                backgroundColor: onPrimaryContainer,
                progressColor: primary,
                percent: widget.percent,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.name,
              style: TextStyle(
                color: neutral,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.artist,
              style: TextStyle(
                color: primary,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.description,
              style: TextStyle(
                color: subtitle,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
