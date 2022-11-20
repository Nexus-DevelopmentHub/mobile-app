import 'package:flutter/material.dart';

class Chiptext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ChoiceChip(
            label: Text('Choice 1'),
            selected: true,
          ),
        ],
      ),
    );
  }
}
