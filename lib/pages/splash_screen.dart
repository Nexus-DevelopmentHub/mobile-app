import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/components/button_socialgoogle.dart';
import 'package:podcast_app/components/chip_text.dart';
import 'package:podcast_app/components/input_ctadetailepisode.dart';
import 'package:podcast_app/components/input_dateofbirth.dart';
import 'package:podcast_app/components/input_password.dart';
import 'package:podcast_app/theme/theme.dart';
import '../components/input_search.dart';
import '../components/input_gender.dart';

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
          InputGender(
            name: 'Jenis kelamin', 
            male: 'Laki-laki',
            female: 'Perempuan')
        ],
      ),
    ));
  }
}
