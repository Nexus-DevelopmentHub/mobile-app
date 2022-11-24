import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class CardTopics extends StatefulWidget {
  const CardTopics({
    super.key,
    required this.name,
    required this.color,
    this.nameImage,
  });

  final String name;
  final Color? color;
  final nameImage;

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
                child: Image.asset('assets/' + widget.nameImage),
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
