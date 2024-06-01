import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';
import '../../Models/app_enums.dart';
import '../../Models/models with isar and to json code generation/category_model.dart';
import '../Custom_icons/this_app_icons.dart';
import 'category_helpers.dart';

// implement try-catch later
class SharedPreferencesHelper {
  static const String _categoriesKey4Blueprints = 'categories';
  static const String _categoriesKey4PieChart = 'categories4chart';
  static String get categoriesKey4Blueprints => _categoriesKey4Blueprints;
  static String get categoriesKey4PieChart => _categoriesKey4PieChart;
  static const String _themeShPrefsKey = 'theme_preference';
  static const String subCategoriesKey = 'subCategories';
  static const String key = 'iconData';

/* THEME */
  static Future<void> saveThemeModeInShPrefs(bool isDarkTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeShPrefsKey, isDarkTheme);
  }

  /* CATEGORIES */
  static Future<void> saveCategoriesInShPref(
      List<CategoriesEnum> categories, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> categoryNames = categories
        .map((category) => CategoriesHelper.categoryDisplayedName(category))
        .toList();
    prefs.setStringList(key, categoryNames);
  }

  static Future<bool> getThemeModeFromShPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDarkMode = prefs.getBool(_themeShPrefsKey) ?? false;
    return isDarkMode;
  }

  static Future<List<CategoriesEnum>> loadCategoriesFromShPrefs(
      String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? storedCategoryNames = prefs.getStringList(key);

    if (storedCategoryNames != null) {
      final List<CategoriesEnum> categories = storedCategoryNames
          .map((categoryName) =>
              CategoriesEnum.values.firstWhereOrNull(
                (item) =>
                    CategoriesHelper.categoryDisplayedName(item) ==
                    categoryName,
              ) ??
              CategoriesEnum.other)
          .toList();
      // print("From loadCategories $categories");
      return categories;
    } else {
      return <CategoriesEnum>[];
    }
  }

  /* SUBCATEGORIES */
  static Future<void> saveSubCategories(
    Map<CategoriesEnum, List<SubCategory>> subCategoriesInput,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> subCategoriesMap = {};

    subCategoriesInput.forEach((key, value) {
      List<List<dynamic>> updatedValue = value.map((subCategory) {
        return [
          subCategory.title,
          // subCategory.iconData.codePoint,
          ThisAppIcons.getCodePointForIconData(subCategory.iconData),
          '#${subCategory.color.value.toRadixString(16)}'
        ];
      }).toList();
      subCategoriesMap[key.toString().split('.').last] = updatedValue;
    });

    String subCategoriesJson = jsonEncode(subCategoriesMap);
    await prefs.setString(subCategoriesKey, subCategoriesJson);
  }

//   static Future<Map<CategoriesEnum, List<SubCategory>>>
//       loadSubCategories() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? subCategoriesJson = prefs.getString(subCategoriesKey);
//     if (subCategoriesJson != null) {
//       Map<String, dynamic> subCategoriesMap = jsonDecode(subCategoriesJson);
//       Map<CategoriesEnum, List<SubCategory>> subCategories = {};

//       // Конвертуємо шістнадцяткові значення кольорів у Color
//       subCategoriesMap.forEach((key, value) {
//         CategoriesEnum categoryEnum = CategoriesEnum.values.firstWhere(
//             (categoryEnum) => categoryEnum.toString() == 'CategoriesEnum.$key');

//         List<SubCategory> updatedValue = (value as List).map((subCategoryData) {
//           return SubCategory(
//             title: subCategoryData[0] as String,
//             iconData: IconData(
//               subCategoryData[1],
//               fontFamily: JBTrackerIcons.kFontFam,
//               fontPackage: JBTrackerIcons.kFontPkg,
//             ),
// // IconData(subCategoryData[1], fontFamily: 'MaterialIcons'),
//             color: Color(
//                 int.parse(subCategoryData[2].replaceFirst('#', ''), radix: 16)),
//           );
//         }).toList();

//         subCategories[categoryEnum] = updatedValue;
//       });
//       return subCategories;
//     } else {
//       return {};
//     }
//   }

  // static Future<void> saveIconData(IconData iconData) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt(key, JBTrackerIcons.getCodePointForIconData(iconData));
  // }

  // static Future<IconData?> loadIconData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int? codePoint = prefs.getInt(key);
  //   if (codePoint != null) {
  //     return IconData(
  //       codePoint,
  //       fontFamily: JBTrackerIcons.kFontFam,
  //       fontPackage: JBTrackerIcons.kFontPkg,
  //     );
  //   } else {
  //     return null;
  //   }
  // }
//
}


/*
Потім, при збереженні іконок у SharedPreferences, ви будете викликати цей метод для кожної іконки, щоб отримати її код символу:

dart
Copy code
List<int> iconCodes = allCustomIcons.map((iconData) => JBTrackerIconsHelper.getCodePointForIconData(iconData)).toList();
А при зчитуванні з SharedPreferences і створенні IconData, ви будете використовувати ці коди символів:

dart
Copy code
List<IconData> allCustomIcons = iconCodes.map((code) => IconData(code, fontFamily: 'JBTrackerIcons')).toList();
Це дозволить вам зберігати і зчитувати дані з SharedPreferences, не змінюючи вихідний клас JBTrackerIcons.
 */