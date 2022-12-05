import 'package:flutter/material.dart';
import 'package:podcast_app/theme/theme.dart';

final ButtonStyle buttonPrimarySmall = ElevatedButton.styleFrom(
    minimumSize: Size(140, 44),
    backgroundColor: primary,
    elevation: 0,
    textStyle: TextStyle(
      color: neutral,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24),
    )));
