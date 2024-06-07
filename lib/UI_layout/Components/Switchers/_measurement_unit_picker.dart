import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../State_management/Helpers/Common/helpers.dart';

class MeasurementUnitPicker extends StatefulWidget {
  final TextEditingController controller;
  final BuildContext context;
  final bool? isFromEditDialog;
  final String? text;

  const MeasurementUnitPicker({
    super.key,
    required this.controller,
    required this.context,
    this.isFromEditDialog,
    this.text,
  });

  @override
  State<MeasurementUnitPicker> createState() => _MeasurementUnitPickerState();
}

class _MeasurementUnitPickerState extends State<MeasurementUnitPicker> {
  late String inputMeasureUnit;
  late int _selectedSegment;

  @override
  void initState() {
    if (widget.isFromEditDialog != null) {
      inputMeasureUnit = widget.text!;
      widget.controller.text = inputMeasureUnit;
      _setSelectedSegment();
    } else {
      _selectedSegment = 5;
      widget.controller.text = "";
    }
    super.initState();
  }

  void _setSelectedSegment() {
    int index = AppStrings.measurementUnits.indexOf(inputMeasureUnit);
    _selectedSegment =
        (index != -1) ? index : AppStrings.measurementUnits.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Helpers.isDarkTheme(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .labelSmall!
        .copyWith(color: colorScheme.primary);

    Map<int, Text> segmentedControlChildren = {
      for (var entry in AppStrings.measurementUnits.asMap().entries)
        entry.key: Text(entry.value,
            style: textStyle.copyWith(
                color: (_selectedSegment == entry.key && isDarkTheme == true)
                    ? colorScheme.secondary
                    : (_selectedSegment == entry.key && isDarkTheme == false)
                        ? colorScheme.onPrimary
                        : null))
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 29,
          padding: const EdgeInsets.all(0.5),
          decoration: BoxDecoration(
            color: colorScheme.surface.withOpacity(0.9),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                color:
                    colorScheme.primary.withOpacity(isDarkTheme ? 0.3 : 0.14),
                blurRadius: isDarkTheme ? 0.25 : 0.31,
                offset: Offset(0.5, isDarkTheme ? 1.5 : 1.5),
              ),
            ],
          ),
          child: CupertinoSlidingSegmentedControl(
            thumbColor:
                colorScheme.primary.withOpacity(isDarkTheme ? 0.15 : 0.45),
            backgroundColor:
                colorScheme.surface.withOpacity(isDarkTheme ? 0.35 : 0.6),
            padding: const EdgeInsets.all(0),
            children: segmentedControlChildren,
            groupValue: _selectedSegment,
            onValueChanged: (value) {
              setState(() {
                _selectedSegment = value as int;
                widget.controller.text =
                    AppStrings.measurementUnits[_selectedSegment];
              });
            },
          ),
        ),
      ],
    );
  }
}
