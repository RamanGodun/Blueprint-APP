import 'package:flutter/material.dart';

class AppLocales {
  final List<Locale> _appLocales = const [
    Locale('en', 'US'),
    Locale('uk', 'UA')
  ];
  List<Locale> get appLocales => _appLocales;
}
