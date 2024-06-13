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
      case ValidatorType.email:
        return validateEmail;
      case ValidatorType.name:
        return validateName;
      default:
        return null;
    }
  }

  static String? validateInteger(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }

    // Checking if the value is an integer
    final intValue = int.tryParse(value);
    if (intValue == null) {
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

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regExp.hasMatch(value)) {
      return 'Невірний формат електронної пошти!';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    final regExp = RegExp(r'^[a-zA-Zа-яА-Я\s-]+$');
    if (!regExp.hasMatch(value)) {
      return 'Ім\'я може містити лише букви, пробіли та дефіси!';
    }
    return null;
  }
}
