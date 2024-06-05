import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../State_management/Const_data/strings_4_app.dart';
import '../../State_management/Src/Custom_icons/app_icons.dart';
import '../../State_management/Src/Helpers/Common/helpers.dart';

class InfoDialog {
  Widget show(BuildContext context, Function(bool) setShowAllExpenses) {
    final TextTheme textTheme = Helpers.textTheme(context);
    TextStyle textStyle = textTheme.titleSmall!.copyWith(fontSize: 10.5);

    return Padding(
      padding: EdgeInsets.only(bottom: Helpers.deviceHeight(context) / 10),
      child: CupertinoAlertDialog(
        insetAnimationDuration: const Duration(milliseconds: 75),
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(AppStrings.userTitle,
                style: Theme.of(context).textTheme.titleSmall),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            _buildRow(
              context,
              AppIcons.infoIcons(
                isDropAndDrugAble: false,
                isSwipeAble: true,
                isForInfoDialog: true,
                context: context,
              ),
              AppStrings.swipeInfo,
              textStyle,
            ),
            const SizedBox(height: 7),
            _buildRow(
              context,
              AppIcons.infoIcons(
                isDropAndDrugAble: true,
                isSwipeAble: false,
                isForInfoDialog: true,
                isFromPieChart: true,
                context: context,
              ),
              AppStrings.dragInfo,
              textStyle,
            ),
            const SizedBox(height: 7),
            _buildRow(
              context,
              IconButton(
                icon: AppIcons.themeIcon(
                  Helpers.isDarkTheme(context),
                ),
                onPressed: () {},
              ),
              AppStrings.themeInfo,
              textStyle,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppStrings.toClose,
              style: textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    Widget leadingIcon,
    String text,
    TextStyle textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 45,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: leadingIcon,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: textStyle,
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}
