import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:podcast_app/components/input_password.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/theme/theme.dart';

class PageContoh extends StatefulWidget {
  const PageContoh({super.key});

  @override
  State<PageContoh> createState() => _PageContohState();
}

class _PageContohState extends State<PageContoh> {
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Text("Sign Up"),
        InputText(name: "name", onChange: (v) {}, placeholder: "Masukkan nama"),
        SizedBox(),
        InputPassword(
            name: "password",
            onChange: (v) {},
            placeholder: "Masukkan password")
      ]),
    );
  }
}
