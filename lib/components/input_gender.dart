import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:podcast_app/theme/theme.dart';

class InputGender extends StatefulWidget {
  const InputGender({Key? key, required this.name, required this.gender}) : super(key: key);

  final String name;
  final String gender;

  @override
  State<InputGender> createState() => _InputGenderState();
}

class _InputGenderState extends State<InputGender> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          widget.name,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: neutral),
        ),
        SizedBox(height: 16),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.gender,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: neutral),
              ),
              ],
          ),
        )
      ]),
    );
  }
}
