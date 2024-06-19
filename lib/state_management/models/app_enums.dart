/*
Here all enums for this app
 */
enum CustomThemeMode {
  lightIOS,
  darkIOS,
  system,
  lightAndroid,
  darkAndroid,
  darkGlass,
  customDark,
  customLight
}

enum CategoriesEnum {
  food,
  transport,
  study,
  rest,
  tech,
  charity,
  health,
  household,
  other
}

enum ValidatorType { integer, double, string, name, email, phoneNumber, sameAs }

enum DialogButtonType {
  actionButtonInIOSStyle,
  actionButtonInAndroidStyle,
  cancelButtonInIOSStyle,
  cancelButtonInAndroidType,
}

enum TextFields { email, password, passwordConfirmation, name }

enum WidgetType {
  textField,
  textFormField,
  cupertinoStyle,
}
