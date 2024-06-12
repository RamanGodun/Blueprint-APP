import '../Models/app_enums.dart';

class TextFieldValidationService {
  static String? Function(String?)? getValidatorFunction(
    ValidatorType type,
    bool allowEmpty,
  ) {
    switch (type) {
      case ValidatorType.integer:
        return validateInteger;
      case ValidatorType.double:
        return validateDouble;
      case ValidatorType.string:
        return (value) => validateString(value, allowEmpty);
      case ValidatorType.phoneNumber:
        return validatePhoneNumber;
      default:
        return null;
    }
  }

  static String? validateInteger(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }

    if (int.tryParse(value) == null ||
        double.tryParse(value) != null ||
        value.startsWith('-')) {
      return 'Введіть ціле число';
    }
    return null;
  }

  static String? validateDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }

    if (double.tryParse(value) == null || value.startsWith('-')) {
      return 'Введіть додатне число';
    }
    return null;
  }

  static String? validateString(String? value, bool allowEmpty) {
    if (value == null || value.isEmpty) {
      return allowEmpty ? null : 'Це поле не може бути пустим';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    final regExp = RegExp(r'^\+380[0-9]{9}$');
    if (!regExp.hasMatch('+380$value')) {
      return 'Невірний номер телефону!';
    }
    return null;
  }
}
