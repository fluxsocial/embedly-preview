import 'package:flutter/material.dart';
import 'package:embedly_preview/theme/theme.dart';

class EmbedlyThemeProvider extends InheritedWidget {
  EmbedlyThemeProvider({Key? key, required this.child, this.data})
      : super(key: key, child: child);

  final Widget child;
  final EmbedlyThemeData? data;

  static EmbedlyThemeData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<EmbedlyThemeProvider>()!
        .data;
  }

  @override
  bool updateShouldNotify(EmbedlyThemeProvider oldWidget) =>
      oldWidget.data != data || oldWidget.child != child;
}
