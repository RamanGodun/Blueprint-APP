import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Src/Const_data/strings_4_app.dart';

import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_General_STYLING_set/app_styling_constants.dart';
import '../_General_STYLING_set/app_text_styling.dart';
import '../_General_STYLING_set/app_box_decoration.dart';

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
    theme = Helpers.themeGet(context);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =
        AppTextStyling.forComplexityPicker(theme, _selectedSegment);
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
        padding: AppStylingConstants.zeroPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 29,
              padding: AppStylingConstants.zeroPadding,
              decoration: AppBoxDecorations.forComplexityPicker(theme),
              child: CupertinoSlidingSegmentedControl(
                thumbColor: colorScheme.primary.withOpacity(0.75),
                backgroundColor: colorScheme.surface.withOpacity(0.25),
                padding: AppStylingConstants.zeroPadding,
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
