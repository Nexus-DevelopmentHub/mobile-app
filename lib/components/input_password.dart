import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key, required this.name});

  final String name;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name, style: TextStyle(color: neutral, fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        TextField(
          style: TextStyle(color: neutral),
          obscureText: !isVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: isVisible
                  ? Icon(Icons.visibility, color: neutral)
                  : Icon(Icons.visibility_off, color: neutral),
            ),
            filled: true,
            fillColor: secondary,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: onSurface)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: primary)),
            hintText: "Masukan password kamu",
            hintStyle: TextStyle(color: onSecondary),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        )
      ],
    );
  }
}
