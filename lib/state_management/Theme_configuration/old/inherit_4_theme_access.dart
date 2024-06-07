// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class ThemeInheritedWidget extends InheritedWidget {
//   final ThemeData themeData;
//   final ColorScheme colorScheme;
//   final CupertinoThemeData cupertinoTheme;

//   const ThemeInheritedWidget({
//     super.key,
//     required this.themeData,
//     required this.colorScheme,
//     required this.cupertinoTheme,
//     required super.child,
//   });

//   static ThemeInheritedWidget? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
//   }

//   @override
//   bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
//     return themeData != oldWidget.themeData ||
//         colorScheme != oldWidget.colorScheme ||
//         cupertinoTheme != oldWidget.cupertinoTheme;
//   }
// }
