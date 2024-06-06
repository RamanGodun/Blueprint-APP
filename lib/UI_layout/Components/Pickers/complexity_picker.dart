import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Src/Const_data/strings_4_app.dart';

class ComplexityPicker extends StatefulWidget {
  final Function(String) setSelectedComplexity;
  const ComplexityPicker({super.key, required this.setSelectedComplexity});

  @override
  State<ComplexityPicker> createState() => _ComplexityPickerState();
}

class _ComplexityPickerState extends State<ComplexityPicker> {
  late int _selectedSegment;

  @override
  void initState() {
    _selectedSegment = 0;
    super.initState();
  }

  // void _setSelectedSegment() {
  //   int index = AppStrings.complexityLevels.indexOf(inputMeasureUnit);
  //   _selectedSegment =
  //       (index != -1) ? index : AppStrings.complexityLevels.length - 1;
  // }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextStyle? textStyle = Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(color: colorScheme.onSurface);

    Map<int, Text> segmentedControlChildren = {
      for (var entry in AppStrings.complexityLevels.asMap().entries)
        entry.key: Text(entry.value,
            style: textStyle?.copyWith(
                color: (_selectedSegment == entry.key)
                    ? colorScheme.onPrimary
                    : (_selectedSegment == entry.key)
                        ? colorScheme.onSurface
                        : null))
    };

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 29,
              padding: const EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                color: colorScheme.surface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.secondary.withOpacity(0.1),
                    blurRadius: 0.25,
                    offset: const Offset(0.5, 1.5),
                  ),
                ],
              ),
              child: CupertinoSlidingSegmentedControl(
                thumbColor: colorScheme.primary.withOpacity(0.75),
                backgroundColor: colorScheme.surface.withOpacity(0.25),
                padding: const EdgeInsets.all(0),
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
