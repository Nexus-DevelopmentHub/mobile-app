import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/style/button_cta.dart';
import 'package:podcast_app/theme/theme.dart';

class CtaDetailEpisode extends StatefulWidget {
  const CtaDetailEpisode(
      {super.key,
      required this.name,
      this.onClick,
      this.onShareClick,
      this.onLikeClick});

  final String name;
  final VoidCallback? onClick;
  final VoidCallback? onShareClick;
  final VoidCallback? onLikeClick;

  @override
  State<CtaDetailEpisode> createState() => _CtaDetailEpisodeState();
}

class _CtaDetailEpisodeState extends State<CtaDetailEpisode> {
  bool isFilled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: buttonCta,
          onPressed: () {
            widget?.onClick?.call();
          },
          child: Text(widget.name),
        ),
        SizedBox(
          width: 4,
        ),
        IconButton(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: neutral,
            onPressed: () {
              widget?.onShareClick?.call();
            },
            icon: Icon(Icons.share_rounded)),
        SizedBox(
          width: 4,
        ),
        IconButton(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: neutral,
            onPressed: () {
              Icon(
                Icons.favorite,
                color: primary,
              );
              widget?.onLikeClick?.call();
            },
            icon: Icon(Icons.favorite_outline_rounded)),
      ],
    );
  }
}
