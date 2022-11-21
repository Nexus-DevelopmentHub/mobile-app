import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/style/button.dart';

class ButtonPrimary extends StatefulWidget {
  const ButtonPrimary({super.key, required this.name, this.onClick});

  final String name;
  final VoidCallback? onClick;

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          style: buttonPrimary,
          child: Text(widget.name),
          onPressed: () {
            widget?.onClick?.call();
          },
        ),
      ],
    );
  }
}
