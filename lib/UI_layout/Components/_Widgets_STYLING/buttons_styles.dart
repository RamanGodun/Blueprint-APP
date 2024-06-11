import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import 'app_text_styles_for_ui.dart';
import 'ui_styling.dart';

abstract class AppButtonsStyle {
  static Widget _buildButton({
    required BuildContext context,
    required Widget child,
    required Color backgroundColor,
    required Color foregroundColor,
    double elevation = 10,
    double borderRadius = 10.0,
    VoidCallback? onPressed,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: elevation,
        padding: padding,
      ),
      child: child,
    );
  }

  static Widget styleFrom(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    double height = 44,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
  }) {
    final theme = Helpers.theme(context);
    final isDark = Helpers.isDarkMode(theme);
    return _buildButton(
      context: context,
      child: Text(
        buttonText,
        style: AppTextStyles.forButtons(theme),
      ),
      backgroundColor:
          AppColors.kAppPrimaryColor.withOpacity(isDark ? 0.6 : 0.85),
      foregroundColor: AppColors.black.withOpacity(isDark ? 0.7 : 0.86),
      onPressed: onPressed,
    );
  }

  static Widget withGradient(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
    double height = 44,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
  }) {
    final theme = Helpers.theme(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: padding,
        decoration: AppBoxDecorations.glassmorphismGradientDecoration(context),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.forButtons(theme),
          ),
        ),
      ),
    );
  }

  static Widget inIOSStyle(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
  }) {
    final theme = Helpers.theme(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        padding: const EdgeInsets.all(12),
        borderRadius: BorderRadius.circular(8),
        pressedOpacity: 0.8,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.play_arrow,
              color: colorScheme.onPrimary,
            ),
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: AppTextStyles.forButtons(theme),
            ),
          ],
        ),
      ),
    );
  }

  static Widget forInterviewerAppAnswerButton(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
  }) {
    final theme = Helpers.theme(context);
    final isDark = Helpers.isDarkMode(theme);
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            theme.colorScheme.surface.withOpacity(isDark ? 0.2 : 0.5),
        side: BorderSide(
          color: theme.colorScheme.primary.withOpacity(0.9),
          width: 0.7,
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelMedium,
          maxLines: 2,
          softWrap: true,
          selectionColor: theme.colorScheme.primary.withOpacity(0.8),
        ),
      ),
    );
  }

  static Widget firstDesign(
    BuildContext context, {
    void Function()? onPressed,
    required String buttonText,
  }) {
    final theme = Helpers.theme(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final isDark = Helpers.isDarkMode(theme);
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          colorScheme.primary.withOpacity(isDark ? 0.75 : 0.9),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          buttonText,
          style: AppTextStyles.forButtons(theme),
        ),
      ),
    );
  }
}
