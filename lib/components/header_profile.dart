import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/style/button_outline.dart';
import 'package:podcast_app/theme/theme.dart';

class HeaderProfile extends StatefulWidget {
  const HeaderProfile(
      {super.key,
      required this.name,
      required this.image,
      required this.placeholder});

  final String name;
  final String image;
  final String placeholder;

  @override
  State<HeaderProfile> createState() => _HeaderProfileState();
}

class _HeaderProfileState extends State<HeaderProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 247,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: DecorationImage(
                image: NetworkImage(widget.image),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: neutral,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                style: buttonOutline,
                onPressed: () {},
                child: Text(
                  widget.placeholder,
                  style: TextStyle(
                    color: neutral,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
