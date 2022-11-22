import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/style/button_google.dart';

class ButtonGoogle extends StatefulWidget {
  const ButtonGoogle({super.key, required this.name, this.onClick});

  final String name;
  final VoidCallback? onClick;

  @override
  State<ButtonGoogle> createState() => _ButtonGoogleState();
}

class _ButtonGoogleState extends State<ButtonGoogle> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ElevatedButton.icon(
          onPressed: (() {
            widget?.onClick?.call();
          }),
          style: buttonGoogle,
          icon: Image.asset('lib/icons/icons_google.png', height: 20,),
          label: Text(widget.name)),
    ]);
  }
}
