import 'package:flutter/material.dart';

class Chiptext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputChip(
        label: const Text("popular"),
        selected: true,
        onSelected: (newstate) {},
      ),
    );
  }
}
