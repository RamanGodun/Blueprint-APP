import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../State_management/Const_data/strings_4_app.dart';
import '../State_management/Src/Custom_icons/app_icons.dart';
import '../State_management/Src/Generated_code/by spider/resources.dart';
import '../State_management/Src/Helpers/helpers.dart';
import '../State_management/Theme_configuration/App_colors_palette/this_app_colors.dart';
import 'Tabs/tabs_from_tracker.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Helpers.isDarkTheme(context);
    Color getBackgroundColor(BuildContext context, bool isDarkTheme) {
      return isDarkTheme
          ? ThisAppColors.black54.withOpacity(0.83)
          : ThisAppColors.grey500.withOpacity(0.85);
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ThisAppImages.flutterLogo,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: getBackgroundColor(context, isDarkTheme),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: Helpers.deviceHeight(context) / 6.5,
                ),
                child: Image.asset(
                  ThisAppImages.flutterLogo,
                  width: double.infinity,
                  height: Helpers.deviceHeight(context) / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSlideToAct(context, isDarkTheme),
              SizedBox(height: Helpers.deviceHeight(context) / 7),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlideToAct(BuildContext context, bool isDarkTheme) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 45),
      child: SlideAction(
        sliderButtonYOffset: -10,
        height: 50,
        borderRadius: 15,
        elevation: 0,
        outerColor: isDarkTheme
            ? const Color.fromARGB(255, 43, 42, 42).withOpacity(0.4)
            : ThisAppColors.grey200.withOpacity(0.1),
        innerColor: isDarkTheme
            ? ThisAppColors.kAppPrimaryColor.withOpacity(0.5)
            : ThisAppColors.kSecondaryColor.withOpacity(0.65),
        submittedIcon: AppIcons.checkIcon4Slider(),
        animationDuration: const Duration(milliseconds: 200),
        sliderButtonIcon: AppIcons.arrowIcon(),
        onSubmit: () async {
          await _openTabsScreen(context);
        },
        child: Container(
          padding: const EdgeInsets.only(left: 35),
          child: Text(
            AppStrings.sliderText,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
      ),
    );
  }

  Future<void> _openTabsScreen(BuildContext context) async {
    Helpers.push(context, const MyAnimatedBottomNavigationBar());
  }
}
