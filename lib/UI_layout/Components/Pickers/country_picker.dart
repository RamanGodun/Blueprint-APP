import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 5.00, top: 7.00, right: 5.00, bottom: 5.00),
      child: InkWell(
        onTap: () {
          showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                backgroundColor: Theme.of(context).focusColor,
                bottomSheetHeight: 450,
              ),
              onSelect: (value) {
                setState(() {
                  selectedCountry = value;
                });
              });
        },
        child: Text(
            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).focusColor,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Country selectedCountry = Country(
    phoneCode: "38",
    countryCode: "UA",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Ukraine",
    example: "Ukraine",
    displayName: "Ukraine",
    displayNameNoCountryCode: "UA",
    e164Key: "",
  );
}
