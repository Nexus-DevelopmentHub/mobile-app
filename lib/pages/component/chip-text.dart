import 'package:flutter/material.dart';

class Chiptext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChoiceChip(
        label: const Text("popular"),
        selected: true,
        selectedColor: Color.fromRGBO(20, 220, 48, 100),
        onSelected: (newstate){},
      ),
    );
  }
}
