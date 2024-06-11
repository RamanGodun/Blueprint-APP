import 'package:blueprint_4app/UI_layout/Components/_Widgets_STYLING/app_paddings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Const_data/strings_4_app.dart';

import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_Widgets_STYLING/app_text_styles_for_ui.dart';
import '../_Widgets_STYLING/ui_styling.dart';

class ComplexityPicker extends StatefulWidget {
  final Function(String) setSelectedComplexity;
  const ComplexityPicker({super.key, required this.setSelectedComplexity});

  @override
  State<ComplexityPicker> createState() => _ComplexityPickerState();
}

class _ComplexityPickerState extends State<ComplexityPicker> {
  late int _selectedSegment;
  late ThemeData theme;

  @override
  void initState() {
    _selectedSegment = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Helpers.theme(context);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =
        AppTextStyles.forComplexityPicker(theme, _selectedSegment);
    final colorScheme = theme.colorScheme;
    final segmentedControlChildren = {
      for (var entry in AppStrings.complexityLevels.asMap().entries)
        entry.key: Text(entry.value,
            style: textStyle?.copyWith(
                color: _selectedSegment == entry.key
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface))
    };

    return Material(
      color: AppColors.transparent,
      child: Padding(
        padding: AppPaddings.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 29,
              padding: AppPaddings.zero,
              decoration: AppBoxDecorations.forComplexityPicker(context),
              child: CupertinoSlidingSegmentedControl(
                thumbColor: colorScheme.primary.withOpacity(0.75),
                backgroundColor: colorScheme.surface.withOpacity(0.25),
                padding: AppPaddings.zero,
                children: segmentedControlChildren,
                groupValue: _selectedSegment,
                onValueChanged: (value) {
                  setState(() {
                    _selectedSegment = value as int;
                    widget.setSelectedComplexity(
                        AppStrings.chosenComplexity[_selectedSegment]);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
