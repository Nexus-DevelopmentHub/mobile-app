import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class CardAudioBook extends StatefulWidget {
  const CardAudioBook({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.index,
    required this.totalIndex,
    required this.onClick,
  });

  final int totalIndex;
  final String image;
  final String name;
  final String description;
  final int index;
  final VoidCallback onClick;

  @override
  State<CardAudioBook> createState() => _CardAudioBookState();
}

class _CardAudioBookState extends State<CardAudioBook> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClick();
      },
      child: Container(
        margin: EdgeInsets.only(
            left: (widget.index == 0) ? 24 : 8,
            right: (widget.index == widget.totalIndex - 1) ? 24 : 0),
        width: 120,
        height: 210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 144,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.fill,
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
                    widget.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
      ),
    );
  }
}
