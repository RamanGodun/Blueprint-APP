import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../State_management/Src/Generated_code/by spider/resources.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../Tabs/tabs_from_tracker.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Helpers.isDarkMode(context);
    Color getBackgroundColor(BuildContext context, bool isDarkTheme) {
      return isDarkTheme
          ? AppColors.black54.withOpacity(0.83)
          : AppColors.grey500.withOpacity(0.85);
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
                  bottom: Helpers.deviceHeightGet(context) / 6.5,
                ),
                child: Image.asset(
                  ThisAppImages.flutterLogo,
                  width: double.infinity,
                  height: Helpers.deviceHeightGet(context) / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSlideToAct(context, isDarkTheme),
              SizedBox(height: Helpers.deviceHeightGet(context) / 7),
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
            : AppColors.grey200.withOpacity(0.1),
        innerColor: isDarkTheme
            ? AppColors.kAppPrimaryColor.withOpacity(0.5)
            : AppColors.kSecondaryColor.withOpacity(0.65),
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
