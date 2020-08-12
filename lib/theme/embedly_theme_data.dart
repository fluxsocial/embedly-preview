
import 'package:flutter/material.dart';

class EmbedlyThemeData {
  factory EmbedlyThemeData({
    Brightness brightness,
    TextStyle headingText,
    TextStyle subheadingText,
    Color backgroundColor,
    double elevation = 1.0,
  }) {
    if (brightness == Brightness.light) {
      return EmbedlyThemeData._(
        brightness: brightness,
        elevation: elevation,
        backgroundColor: backgroundColor ?? Colors.white,
        headingText: headingText ??
            TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
        subheadingText: subheadingText ??
            TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
      );
    } else {
      return EmbedlyThemeData._(
        brightness: brightness,
        elevation: elevation,
        backgroundColor: backgroundColor ?? Color(0xFF041B1F),
        headingText: headingText ??
            TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
        subheadingText: subheadingText ??
            TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
      );
    }
  }

  const EmbedlyThemeData._({
    this.brightness,
    this.headingText,
    this.subheadingText,
    this.backgroundColor,
    this.elevation,
  });

  final Brightness brightness;
  final TextStyle headingText;
  final TextStyle subheadingText;
  final Color backgroundColor;
  final double elevation;
}
