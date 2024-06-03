import 'package:flutter/material.dart';

class MyFirstRTopThemes {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF000000),
    canvasColor: const Color(0xFF1B1B1B),
    hoverColor: const Color(0xFF525559),
    focusColor: const Color(0xFFFFFFFF),
    shadowColor: const Color(0xFF999A9B),
    indicatorColor: const Color.fromARGB(255, 227, 171, 79),
    primaryColorLight: Colors.yellow.withOpacity(0.5),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: IOSDarkThemeColors.white,
      selectedIconTheme: IconThemeData(color: IOSDarkThemeColors.white),
      unselectedIconTheme: IconThemeData(color: IOSDarkThemeColors.hover),
      unselectedLabelStyle: TextStyle(color: IOSDarkThemeColors.lightGrey),
      selectedLabelStyle: TextStyle(color: IOSDarkThemeColors.white),
      showUnselectedLabels: false,
      backgroundColor: IOSDarkThemeColors.silver,
      elevation: 0,
    ),

    fontFamily: 'Montserrat',
    //
    // here I can add other parameters for this theme
    //
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.yellow,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    fontFamily: 'Montserrat',
    focusColor: Colors.black.withOpacity(0.5),
    hoverColor: const Color.fromARGB(255, 224, 227, 207),
    indicatorColor: const Color(0xFFD17741),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFFD17741)),
    // here I can add other parameters for this theme
  );

  // some decoration const here
  static const textInputDecoration = InputDecoration(
    labelStyle:
        TextStyle(color: IOSDarkThemeColors.white, fontWeight: FontWeight.w300),
    hintStyle:
        TextStyle(color: IOSDarkThemeColors.white, fontWeight: FontWeight.w300),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFee7b64), width: 0.5),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFee7b64), width: 0.5),
    ),
  );
}

// Color pallette for IOS

class IOSDarkThemeColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color silver = Color(0xFF999A9B);
  static const Color lightGrey = Color(0xFF777777);
  static const Color grey1 = Color(0xFF242424);
  static const Color grey2 = Color(0xFF666666);
  static const Color darkGrey1 = Color(0xFF3A3A3A);
  static const Color darkGrey2 = Color(0xFF454545);
  static const Color darkGrey3 = Color(0xFF343434);
  static const Color darkGrey4 = Color(0xFF1F1F1F);
  static const Color black1 = Color(0xFF000000);
  static const Color black = Color(0xFF1B1B1B);
  static const Color amber1 = Colors.amber;
  static const Color amber2 = Color(0xFFB56933);
  static const Color darkAmber1 = Color(0xFF8F4E26);
  static const Color darkAmber2 = Color(0xFF753B1F);
  static const Color yellow1 = Color.fromARGB(255, 227, 171, 79);
  static const Color yellow2 = Color.fromARGB(255, 255, 179, 0);
  static const Color shadow = Color(0xFF999A9B);
  static const Color hover = Color(0xFF525559);
}

class IOSLightThemeColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color silver = Color(0xFF999A9B);
  static const Color lightGrey = Color(0xFF777777);
  static const Color grey1 = Color(0xFF242424);
  static const Color grey2 = Color(0xFF666666);
  static const Color darkGrey1 = Color(0xFF3A3A3A);
  static const Color darkGrey2 = Color(0xFF454545);
  static const Color darkGrey3 = Color(0xFF343434);
  static const Color darkGrey4 = Color(0xFF1F1F1F);
  static const Color amber1 = Color(0xFFD17741);
  static const Color amber2 = Color(0xFFB56933);
  static const Color darkAmber1 = Color(0xFF8F4E26);
  static const Color darkAmber2 = Color(0xFF753B1F);
  static const Color yellow1 = Color.fromARGB(255, 227, 171, 79);
  static const Color yellow2 = Color(0xFFBF8C55);
  static const Color shadow = Color(0xFF999A9B);
}
