import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:podcast_app/theme/theme.dart';

class InputGender extends StatefulWidget {
  const InputGender({Key? key, required this.name, required this.male, required this.female})
      : super(key: key);

  final String name;
  final String male;
  final String female;

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
          widget.name,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: neutral),
        ),
        SizedBox(height: 16),
          
          Row(
        children: [
        Container(
          width: 164,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value as int?;
                    });
                  },
                ),
              Text(
                widget.male,
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
          width: 164,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as int?;
                  });
                },
              ),
              Text(
                widget.female,
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
      )
    );
  }
}
