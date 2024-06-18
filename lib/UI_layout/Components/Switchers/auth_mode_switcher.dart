import 'package:flutter/material.dart';

import '../../../State_management/Theme_configuration/app_colors.dart';

class AuthModeSwitcher extends StatelessWidget {
  final bool isLoginPage;
  final Function() changeAuthMode;

  const AuthModeSwitcher({
    super.key,
    required this.isLoginPage,
    required this.changeAuthMode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Material(
      color: AppColors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isLoginPage ? 'Not a member?' : 'Already have an account?',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: changeAuthMode,
            child: Text(
              isLoginPage ? 'Register now' : 'Log in now',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
