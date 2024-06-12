import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Generated_code/by spider/resources.dart';
import '_cards_and_tiles_styling.dart';

enum LogInType { googleSignIn, appleSignIn, phoneSignIn }

class SignInTile extends StatelessWidget {
  const SignInTile({super.key, required this.onTap, required this.logInType});

  final Function() onTap;
  final LogInType logInType;

  @override
  Widget build(BuildContext context) {
    final theme = Helpers.themeGet(context);
    return GestureDetector(
      onTap: onTap,
      child: CardsAndTilesStyling.forTileContainer(
        theme,
        child: Image.asset(
          (logInType == LogInType.googleSignIn)
              ? ThisAppImages.google
              : ThisAppImages.apple,
          height: 30,
        ),
        fromSignPage: true,
      ),
    );
  }
}
