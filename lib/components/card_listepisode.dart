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
      this.onDownnload,
      required this.totalIndex,
      required this.index,
      required this.onClick});

  final VoidCallback onClick;
  final int totalIndex;
  final int index;
  final String name;
  final String artist;
  final String image;
  final VoidCallback? onDownnload;

  @override
  State<ListEpisode> createState() => _ListEpisodeState();
}

class _ListEpisodeState extends State<ListEpisode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: (widget.index == 0) ? 8 : 8,
      ),
      width: 327,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: GestureDetector(
              onTap: () {
                widget?.onClick?.call();
              },
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(image: NetworkImage(widget.image)),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 14,
                          bottom: 14,
                        ),
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          widget.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: neutral,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
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
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              color: neutral,
              onPressed: () {},
              icon: Icon(Icons.download_rounded)),
        ],
      ),
    );
  }
}
