import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:podcast_app/theme/theme.dart';

class InputGender extends StatefulWidget {
  const InputGender(
      {Key? key,
      required this.label,
      required this.onChange,
      required this.placeholder})
      : super(key: key);

  final String label;
  final Function(String) onChange;
  final String placeholder;

  @override
  State<InputGender> createState() => _InputGenderState();
}

class _InputGenderState extends State<InputGender> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: neutral),
        ),
        SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: 120,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  activeColor: primary,
                  value: 1,
                  groupValue: _value,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => primary),
                  onChanged: (value) {
                    widget.onChange('Laki-laki');
                    setState(() {
                      _value = value as int?;
                    });
                  },
                ),
                Text(
                  'Laki-laki',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: neutral),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 120,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  activeColor: primary,
                  value: 2,
                  groupValue: _value,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => primary),
                  onChanged: (value) {
                    widget.onChange('Perempuan');
                    setState(() {
                      _value = value as int?;
                    });
                  },
                ),
                Text(
                  'Perempuan',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: neutral),
                ),
              ],
            ),
          )
        ]),
      ],
    ));
  }
}
