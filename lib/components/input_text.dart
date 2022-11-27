import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class InputText extends StatefulWidget {
  const InputText(
      {super.key,
      required this.name,
      required this.onChange,
      required this.placeholder});

  final String name;
  final Function(String) onChange;
  final String placeholder;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name,
            style: TextStyle(
                color: neutral, fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        TextField(
          onChanged: (value) {
            widget.onChange(value);
          },
          style: TextStyle(color: neutral),
          obscureText: !isVisible,
          decoration: InputDecoration(
            filled: true,
            fillColor: secondary,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: onSurface)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: primary)),
            hintText: widget.placeholder,
            hintStyle: TextStyle(color: onSecondary),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        )
      ],
    );
  }
}
