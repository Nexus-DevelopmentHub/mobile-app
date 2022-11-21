import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class ChipText extends StatefulWidget {
  const ChipText({super.key, required this.name, this.onClick});

  final String name;
  final VoidCallback? onClick;

  @override
  State<ChipText> createState() => _ChipTextState();
}

class _ChipTextState extends State<ChipText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InputChip(
      labelStyle: TextStyle(color: neutral),
      padding: EdgeInsets.all(8.16),
      backgroundColor: onSurface,
      label: Text(widget.name),
      onPressed: (() {
        widget?.onClick?.call();
      }),
    ));
  }
}
