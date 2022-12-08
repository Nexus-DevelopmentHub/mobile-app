import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme/theme.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch(
      {super.key, required this.name, required this.image, this.onClick});

  final String name;
  final String image;
  final VoidCallback? onClick;

  @override
  State<RecentSearch> createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  height: 56,
                  width: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(image: NetworkImage(widget.image)),
                  )),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                  ),
                  Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: neutral,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              color: neutral,
              onPressed: () {
                widget?.onClick?.call();
              },
              icon: Icon(Icons.close_rounded)),
        ],
      ),
    );
  }
}
