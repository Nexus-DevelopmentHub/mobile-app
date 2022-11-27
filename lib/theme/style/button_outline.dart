import 'package:flutter/material.dart';
import 'package:podcast_app/theme/theme.dart';

final ButtonStyle buttonOutline = ElevatedButton.styleFrom(
    minimumSize: Size(92, 40),
    backgroundColor: onNeutral,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: primary)));
