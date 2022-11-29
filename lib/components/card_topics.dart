import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class CardTopics extends StatefulWidget {
  const CardTopics({
    super.key,
    required this.name,
    required this.color, required this.Image, required this.index, required this.totalIndex,
  });

  final int totalIndex;
  final int index;
  final String name;
  final Color? color;
  final String Image;

  @override
  State<CardTopics> createState() => _CardTopicsState();
}

class _CardTopicsState extends State<CardTopics> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
          left: (widget.index == 0) ? 24 : 8,
          right: (widget.index == widget.totalIndex - 1) ? 24 : 0),
          height: 88,
          width: 152,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  color: neutral,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                child: Image.network(widget.Image),
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: widget.color),
        )
      ],
    );
  }
}
