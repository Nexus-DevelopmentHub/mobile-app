import 'package:flutter/material.dart';
import 'package:podcast_app/theme/theme.dart';

final ButtonStyle buttonGoogle = ElevatedButton.styleFrom(
    minimumSize: Size(321, 44),
    backgroundColor: onSurface,
    elevation: 0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
      Radius.circular(24),
    )));
