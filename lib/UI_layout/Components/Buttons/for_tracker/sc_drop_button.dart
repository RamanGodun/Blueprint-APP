import 'package:flutter/material.dart';

import '../../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_subcategory.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../_Widgets_STYLING/app_box_decoration.dart';
import '../../_Widgets_STYLING/app_styling_constants.dart';
import '../../_Widgets_STYLING/app_text_styles.dart';
import 'dd_button_from_tracker.dart';

class SubCategoryDropButton extends StatefulWidget {
  const SubCategoryDropButton({
    super.key,
    this.item,
    required this.subCategoriesOfSelectedCategory,
    required this.onSubCategoryChanged,
    required this.currentSubCategory,
  });

  final ItemModel? item;
  final List<SubCategory> subCategoriesOfSelectedCategory;
  final ValueChanged<SubCategory> onSubCategoryChanged;
  final SubCategory currentSubCategory;

  @override
  State<SubCategoryDropButton> createState() => _SubCategoryDropButtonState();
}

class _SubCategoryDropButtonState extends State<SubCategoryDropButton> {
  late ColorScheme _colorScheme;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Helpers.isDarkMode(context);
    _colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoratedDropButton(
      colorScheme: _colorScheme,
      child: DropdownButtonFormField<SubCategory>(
        value: widget
            .subCategoriesOfSelectedCategory[getIndexForCurrentSubCategory()],
        onChanged: (SubCategory? value) {
          if (value != null) {
            widget.onSubCategoryChanged(value);
          }
        },
        items: _buildDropdownItems(context),
        dropdownColor: AppStylingConstants.getDropdownColor(isDarkTheme),
        focusColor: _colorScheme.primary,
        itemHeight: 35,
        elevation: 10,
        style: AppTextStyles.forDDButtonTextStyle(context),
        decoration: AppBoxDecorations.getInputDecoration(context, isDarkTheme),
      ),
    );
  }

  List<DropdownMenuItem<SubCategory>> _buildDropdownItems(
      BuildContext context) {
    final textStyle = AppTextStyles.forDDButtonTextStyle(context);
    return widget.subCategoriesOfSelectedCategory.map((subCategory) {
      return DropdownMenuItem<SubCategory>(
        value: subCategory,
        key: ValueKey(subCategory),
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Icon(
                subCategory.iconData,
                size: 15,
                color: subCategory.color,
              ),
              const SizedBox(width: 6),
              Text(
                subCategory.title,
                style: textStyle.copyWith(color: subCategory.color),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  int getIndexForCurrentSubCategory() {
    for (int i = 0; i < widget.subCategoriesOfSelectedCategory.length; i++) {
      if (widget.subCategoriesOfSelectedCategory[i].title ==
          widget.currentSubCategory.title) {
        return i;
      }
    }
    return 0;
  }
}
