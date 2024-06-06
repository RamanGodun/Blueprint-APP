import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../State_management/Src/Custom_icons/app_icons.dart';
import '../../../State_management/Helpers/Common/helpers.dart';

class DatePickerRow extends StatefulWidget {
  const DatePickerRow({
    super.key,
    required this.initialDate,
    required this.onDateChanged,
  });

  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  @override
  State<DatePickerRow> createState() => _DatePickerRowState();
}

class _DatePickerRowState extends State<DatePickerRow> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'uk';

    return SizedBox(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 35),
          Text(
            Helpers().formattedTime(selectedDate),
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
          ),
          IconButton(
            onPressed: () async {
              DateTime? pickedDate = await showCupertinoModalPopup(
                context: context,
                builder: (BuildContext builder) {
                  Intl.defaultLocale = 'uk';

                  return Localizations.override(
                    context: context,
                    locale: const Locale('uk', 'UA'),
                    child: SizedBox(
                      height: Helpers.deviceHeight(context) / 4,
                      child: CupertinoDatePicker(
                        showDayOfWeek: false,
                        mode: CupertinoDatePickerMode.date,
                        dateOrder: DatePickerDateOrder.dmy,
                        minimumDate:
                            DateTime.now().subtract(const Duration(days: 365)),
                        maximumDate: DateTime.now(),
                        initialDateTime: selectedDate,
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() {
                            selectedDate = newDateTime;
                          });
                          widget.onDateChanged(newDateTime);
                        },
                      ),
                    ),
                  );
                },
              );

              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
                widget.onDateChanged(pickedDate);
              }
            },
            icon: Row(
              children: [
                AppIcons.calendar(),
                AppIcons.flipIcon(null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
