import 'package:flutter/material.dart';

/// Bikin color pallete
///
Color primary = HexColor.fromHex("#14DC94");
Color onPrimary = HexColor.fromHex("#1B1A1F");
Color primaryContainer = HexColor.fromHex("#14DC94");
Color onPrimaryContainer = HexColor.fromHex("#1A4137");
Color neutral = HexColor.fromHex("#FFFFFF");
Color onNeutral = HexColor.fromHex("#1B1A1F");
Color surface = HexColor.fromHex("#FFFFFF");
Color onSurface = HexColor.fromHex("#49484C");


//todo:: masih mencari schema
ThemeData theme = ThemeData(
  primaryColor: primary,
  // onPrimaryColor : onPrimary,
  // primaryContainerColor : primaryContainer
  // onPrimaryContainerColor : onPrimaryContainerColor
  // neutralColor : neutral
  // onNeutralColor : onNeutral
  // surfaceColor : surface
  // onSurfaceColor : onSurface
);


extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}