import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class HeaderPlayer extends StatefulWidget {
  const HeaderPlayer(
      {super.key,
      required this.createdBy,
      required this.title,
      required this.thumbnail});

  final String createdBy;
  final String title;
  final String thumbnail;

  @override
  State<HeaderPlayer> createState() => _HeaderPlayerState();
}

class _HeaderPlayerState extends State<HeaderPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.createdBy,
            style: TextStyle(
              color: primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: neutral,
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 326,
            width: 326,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image(
                image: NetworkImage(widget.thumbnail),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
