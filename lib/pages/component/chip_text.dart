import 'package:flutter/material.dart';

class Chiptext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InputChip(
        label: const Text("popular"),
        selected: true,
        onSelected: (newstate) {},
      )
    ]);
  }
}
