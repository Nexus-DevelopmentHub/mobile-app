import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/style/button_outline.dart';
import 'package:podcast_app/theme/theme.dart';

class HeaderDetailPodcast extends StatefulWidget {
  const HeaderDetailPodcast(
      {super.key,
      required this.image,
      required this.name,
      required this.description,
      this.onClick,
      required this.artist});

  final String image;
  final String artist;
  final String description;
  final String name;
  final VoidCallback? onClick;

  @override
  State<HeaderDetailPodcast> createState() => _HeaderDetailPodcastState();
}

class _HeaderDetailPodcastState extends State<HeaderDetailPodcast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 208,
                width: 208,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image(image: NetworkImage(widget.image)),
                ),
              ),
              ElevatedButton(
                  style: buttonOutline,
                  onPressed: (() {
                    widget?.onClick?.call();
                  }),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: primary,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.artist,
                style: TextStyle(
                  color: neutral,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 8,
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
      ),
    );
  }
}
