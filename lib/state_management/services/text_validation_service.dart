import '../Models/app_enums.dart';

class TextFieldValidationService {
  static String? Function(String?)? getValidatorFunction(
      ValidatorType type, bool allowEmpty,
      [String etalonText = '', int minLength = 3]) {
    switch (type) {
      case ValidatorType.integer:
        return (value) => validateInteger(value, minLength);
      case ValidatorType.double:
        return (value) => validateDouble(value, minLength);
      case ValidatorType.string:
        return (value) => validateString(value, allowEmpty, minLength);
      case ValidatorType.phoneNumber:
        return (value) => validatePhoneNumber(value, minLength);
      case ValidatorType.email:
        return (value) => validateEmail(value, minLength);
      case ValidatorType.name:
        return (value) => validateName(value, minLength);
      case ValidatorType.sameAs:
        return (value) => validateSameAs(value, etalonText, minLength);
      default:
        return null;
    }
  }

  static String? validateInteger(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    if (value.length < minLength) {
      return 'Недостатня кількість символів';
    }
    final intValue = int.tryParse(value);
    if (intValue == null) {
      return 'Введіть ціле число';
    }
    return null;
  }

  static String? validateDouble(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    if (value.length < minLength) {
      return 'Недостатня кількість символів';
    }
    if (double.tryParse(value) == null || value.startsWith('-')) {
      return 'Введіть додатне число';
    }
    return null;
  }

  static String? validateString(String? value, bool allowEmpty, int minLength) {
    if (value == null || value.isEmpty) {
      return allowEmpty ? null : 'Це поле не може бути пустим';
    }
    if (value.length < minLength) {
      return 'Недостатня кількість символів';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    if (value.length < minLength) {
      return 'Недостатня кількість символів';
    }
    final regExp = RegExp(r'^\+380[0-9]{9}$');
    if (!regExp.hasMatch('+380$value')) {
      return 'Невірний номер телефону!';
    }
    return null;
  }

  static String? validateEmail(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    if (value.length < minLength) {
      return 'Недостатня кількість символів';
    }
    final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regExp.hasMatch(value)) {
      return 'Поки що невірний формат е-mail!';
    }
    return null;
  }

  static String? validateName(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    if (value.length < minLength) {
      return 'Недостатня кількість символів';
    }
    final regExp = RegExp(r'^[a-zA-Zа-яА-Я\s-]+$');
    if (!regExp.hasMatch(value)) {
      return 'Ім\'я може містити лише букви, пробіли та дефіси!';
    }
    return null;
  }

  static String? validateSameAs(
      String? value, String etalonText, int minLength) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    if (value.length < minLength) {
      return 'Недостатня кількість символів';
    }
    if (value != etalonText) {
      return 'Текст не співпадає з еталонним';
    }
    return null;
  }

/** */
}
