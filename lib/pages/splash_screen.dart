import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/components/button_socialgoogle.dart';
import 'package:podcast_app/components/chip_text.dart';
import 'package:podcast_app/components/input_password.dart';
import 'package:podcast_app/theme/theme.dart';
import '../components/input_search.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: onNeutral,
      child: Column(
        children: [
          InputPassword(
            name: 'Password',
            onChange: (value) {},
            placeholder: 'Masukan password kamu',
          )
        ],
      ),
    ));
  }
}
