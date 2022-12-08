import 'package:flutter/material.dart';

class PageLive extends StatefulWidget {
  const PageLive({Key? key}) : super(key: key);

  @override
  State<PageLive> createState() => _PageLiveState();
}

class _PageLiveState extends State<PageLive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
          "Under Construction",
        style: TextStyle(
          color: Colors.grey
        ),
      ),
    );
  }
}
