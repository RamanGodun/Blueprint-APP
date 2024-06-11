import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../State_management/Helpers/Common/helpers.dart';
import '../../../State_management/Theme_configuration/app_colors.dart';
import '../_Widgets_STYLING/app_text_styles_for_ui.dart';

class QuantityPicker extends StatefulWidget {
  final Function(double) setSelectedQuantity;
  const QuantityPicker({super.key, required this.setSelectedQuantity});

  @override
  State<QuantityPicker> createState() => _QuantityPickerState();
}

class _QuantityPickerState extends State<QuantityPicker> {
  double _sliderSelectedValue = 0.0;
  double _pickerSelectedValue = 0;
  late ThemeData theme;
  late ColorScheme colorScheme;
  late TextTheme textTheme;
  late Size deviceSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Helpers.theme(context);
    colorScheme = theme.colorScheme;
    textTheme = theme.textTheme;
    deviceSize = Helpers.deviceSize(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: AppColors.transparent,
            child: Slider(
              label: _sliderSelectedValue.toString(),
              overlayColor: WidgetStateProperty.all<Color>(
                  colorScheme.secondary.withOpacity(0.05)),
              activeColor: colorScheme.primary,
              thumbColor: colorScheme.primary,
              value: _sliderSelectedValue,
              min: 0.0,
              max: 100.0,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _sliderSelectedValue = value;
                  widget.setSelectedQuantity(getSelectedQuantity());
                });
              },
            ),
          ),
          SizedBox(
            height: deviceSize.height * 0.12,
            child: Material(
              color: Colors.transparent,
              child: CupertinoPicker(
                looping: true,
                useMagnifier: true,
                magnification: 1.17,
                itemExtent: 35,
                onSelectedItemChanged: (index) {
                  setState(() {
                    _pickerSelectedValue = index.toDouble();
                    widget.setSelectedQuantity(getSelectedQuantity());
                  });
                },
                children: List.generate(
                  10,
                  (index) => Center(
                    child: Text(
                      '$index',
                      style: AppTextStyles.forFIPicker(theme, colorScheme),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double getSelectedQuantity() {
    final double selectedQuantity =
        (_sliderSelectedValue + _pickerSelectedValue).clamp(1, 100);
    return selectedQuantity;
  }
}
