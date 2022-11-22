import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../theme/theme.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({super.key, this.onChange});

  final VoidCallback? onChange;

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
          textInputAction: TextInputAction.search,
          style: Theme.of(context).textTheme.bodyText1,
          onChanged: (value) {
            widget.onChange;
          },
          decoration: InputDecoration(
              hintText: "Find topics, podcaster, etc",
              fillColor: neutral,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              focusColor: neutral,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              prefixIcon: Icon(
                Icons.search,
              )))
    ]);
  }
}
