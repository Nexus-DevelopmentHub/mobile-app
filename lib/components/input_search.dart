import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../theme/theme.dart';

class InputSearch extends StatefulWidget {
  const InputSearch(
      {super.key,
      required this.name,
      required this.onChange,
      required this.placeholder});

  final String name;
  final Function(String) onChange;
  final String placeholder;

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.name,
          style: TextStyle(
              color: neutral, fontSize: 14, fontWeight: FontWeight.w500)),
      TextFormField(
          textInputAction: TextInputAction.search,
          style: TextStyle(color: neutral),
          onChanged: (value) {
            widget.onChange(value);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: secondary,
            hintText: widget.placeholder,
            hintStyle: TextStyle(color: onSecondary),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: primary)),
            focusColor: neutral,
            labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            // prefixIcon: Icon(
            //   color: primary,
            //   Icons.search,
            // ),
          ))
    ]);
  }
}
