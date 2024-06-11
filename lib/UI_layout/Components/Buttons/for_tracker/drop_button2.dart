import 'package:flutter/material.dart';

import '../../../../State_management/Models/app_enums.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_category.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../../State_management/Providers/Provider_4_tracker/categories_provider.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../_Widgets_STYLING/_for_theme_drop_down_button.dart';
import 'dd_button_from_tracker.dart';

class DropButton extends StatefulWidget {
  const DropButton({
    super.key,
    this.item,
    required this.onCategoryChanged,
    this.initialCategoryForSubCategories,
    this.onCategorySelected,
  });

  final ItemModel? item;
  final ValueChanged<Category> onCategoryChanged;
  final Category? initialCategoryForSubCategories;
  final VoidCallback? onCategorySelected;

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  late Category _selectedCategory;
  late ColorScheme _colorScheme;

  @override
  void initState() {
    if (widget.item != null && widget.initialCategoryForSubCategories == null) {
      _selectedCategory = widget.item!.selectedCategory!;
    } else if (widget.item == null &&
        widget.initialCategoryForSubCategories != null) {
      _selectedCategory = widget.initialCategoryForSubCategories!;
    } else {
      _selectedCategory =
          CategoriesProvider().kCategoriesData[CategoriesEnum.other]!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Helpers.isDarkMode(context);
    _colorScheme = Helpers.colorSchemeGet(context);
    return BoxDecoratedDropButton(
      colorScheme: _colorScheme,
      child: DropdownButtonFormField<Category>(
        value: _selectedCategory,
        onChanged: (Category? value) {
          if (value != null) {
            setState(() {
              widget.onCategoryChanged(value);
              if (widget.onCategorySelected != null) {
                widget.onCategorySelected!();
              }
            });
          }
        },
        items: _buildDropdownItems(context),
        dropdownColor: DropButtonStyle.getDropdownColor(context, isDarkTheme),
        focusColor: _colorScheme.primary,
        itemHeight: 35,
        elevation: 10,
        style: DropButtonStyle.getTextStyle(context),
        decoration: DropButtonStyle.getInputDecoration(context, isDarkTheme),
      ),
    );
  }

  List<DropdownMenuItem<Category>> _buildDropdownItems(BuildContext context) {
    final textStyle = DropButtonStyle.getTextStyle(context);

    return CategoriesProvider().kCategoriesData.entries.map((entry) {
      final category = entry.value;
      return DropdownMenuItem<Category>(
        key: ValueKey(entry.key),
        value: category,
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Icon(
                category.iconData,
                size: 15,
                color: category.color,
              ),
              const SizedBox(width: 6),
              Text(
                category.title,
                style: textStyle.copyWith(color: category.color),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
//
}
