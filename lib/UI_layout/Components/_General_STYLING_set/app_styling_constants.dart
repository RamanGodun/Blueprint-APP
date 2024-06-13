import 'package:flutter/material.dart';

abstract class AppStylingConstants {
  // Елевація
  static const double elevation = 0;

  // Загальний радіус для обводки
  static const double generalBorderRadius = 7.5;

  // Висота кнопок
  static const double buttonsHeight = 45;

  // Розмір іконок
  static const double iconSize = 25;

  // Загальний радіус для обводки, що використовується часто
  static final BorderRadius commonBorderRadius =
      BorderRadius.circular(generalBorderRadius);

  // Радіус 12, часто використовується
  static final BorderRadius radius12 = BorderRadius.circular(12);

  /* PADDINGS */

  // Пустий внутрішній відступ
  static const EdgeInsets zeroPadding = EdgeInsets.all(0.0);

  // Внутрішній відступ 10 для всіх сторін
  static const EdgeInsets allPadding10 = EdgeInsets.all(10.0);

  // Горизонтальний внутрішній відступ 8
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: 8.0);

  // Загальний внутрішній відступ
  static const EdgeInsets commonPadding =
      EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0);

  // Мінімальний горизонтальний внутрішній відступ
  static const EdgeInsets minHorizontal =
      EdgeInsets.symmetric(vertical: 0, horizontal: 3);

  /* PADDING FOR SPECIFIC WIDGETS */

  // Внутрішній відступ для жирного роздільника
  static const EdgeInsets forBoldDivider =
      EdgeInsets.only(right: 0, top: 0.0, bottom: 0.0);

  // Внутрішній відступ для роздільника
  static const EdgeInsets forDivider =
      EdgeInsets.only(left: 10.0, right: 14, top: 0.0, bottom: 0.0);
}
