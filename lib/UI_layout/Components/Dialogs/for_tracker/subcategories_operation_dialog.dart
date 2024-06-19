import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_category.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_subcategory.dart';
import '../../../../State_management/Src/Custom_icons/custom_icons_src.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../Text_fields/app_text_fields.dart';
import '../../Buttons/for_tracker/drop_button2.dart';
import '../../Pickers/icon_picker.dart';
import 'color_picker_window.dart';

class SubCategoriesOperationDialog extends StatefulWidget {
  const SubCategoriesOperationDialog({
    super.key,
    required this.nameController,
    required this.refreshFunction,
    required this.scaffoldKey,
    required this.category,
    required this.isNewSubcategory,
    required this.refreshingOfItemsData,
    this.selectedSubCategory,
  });

  final TextEditingController nameController;
  final VoidCallback refreshFunction;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Category category;
  final bool isNewSubcategory;
  final SubCategory? selectedSubCategory;
  final Function refreshingOfItemsData;

  @override
  State<SubCategoriesOperationDialog> createState() =>
      _SubCategoriesOperationDialogState();
}

class _SubCategoriesOperationDialogState
    extends State<SubCategoriesOperationDialog> {
  late Category _selectedCategory;
  // late bool _isCategoryWasChanged;
  List<ItemModel> allItemsFromDB = [];
  late Color selectedColor;
  late IconData selectedIcon;
  late ThemeData theme;
  late TextTheme textTheme;
  late Size deviceSize;
  late ValueNotifier<bool> isValid;

  @override
  void initState() {
    _selectedCategory = widget.category;
    // _isCategoryWasChanged = false;
    selectedColor = widget.isNewSubcategory
        ? Colors.black
        : widget.selectedSubCategory!.color;
    selectedIcon = widget.isNewSubcategory
        ? ThisAppIcons.emoHappy
        : widget.selectedSubCategory!.iconData;
    // getAllItems();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ThemeData theme = Helpers.themeGet(context);
    textTheme = theme.textTheme;
    deviceSize = Helpers.deviceSizeGet(context);
  }
  // void getAllItems() {
  //   Provider.of<ItemsDataBase>(context, listen: false)
  //       .getAllItemsFromDB()
  //       .then((allItems) {
  //     setState(() {
  //       allItemsFromDB = allItems;
  //       print(allItemsFromDB);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = textTheme.displaySmall!
        .copyWith(color: Theme.of(context).colorScheme.onSurface);

    return Material(
      child: Padding(
        padding: EdgeInsets.only(bottom: deviceSize.height / 10),
        child: CupertinoAlertDialog(
          title: Text(
            widget.isNewSubcategory
                ? AppStrings.newSubCategoryCreating
                : AppStrings.editSubCategory,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const SizedBox(width: 10),
              AppTextField(
                // controller: widget.nameController,
                hintText: (widget.selectedSubCategory != null)
                    ? widget.selectedSubCategory!.title
                    : AppStrings.enterSubCategoryName,
                theme: theme,
                isValid: isValid,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(AppStrings.subCategoryName, style: labelStyle)),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(AppStrings.category, style: labelStyle),
              ),
              const SizedBox(height: 3),
              SizedBox(
                child: DropButton(
                    initialCategoryForSubCategories: _selectedCategory,
                    onCategoryChanged: (newCategory) {
                      setState(
                        () {
                          _selectedCategory = newCategory;
                        },
                      );
                    },
                    onCategorySelected: () {
                      if (widget.category.title != _selectedCategory.title) {
                        setState(() {
                          // _isCategoryWasChanged = true;
                        });
                      }
                    }),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(AppStrings.color4SubCategory, style: labelStyle),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 20,
                width: deviceSize.width / 1.5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: deviceSize.width / 3.85,
                      height: 22,
                      decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    ColorPickerWidget(
                        subCategoryColor: selectedColor,
                        onColorChanged: (color) {
                          setState(() {
                            selectedColor = color;
                          });
                        }),
                    SizedBox(width: deviceSize.width / 7.85),
                    Icon(selectedIcon, size: 15, color: selectedColor),
                    const SizedBox(width: 8),
                    IconPickerWidget(
                        colorOfIcon: selectedColor,
                        onIconSelected: (icon) {
                          setState(() {
                            selectedIcon = icon;
                          });
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          // BUTTONS
          actions: const [
            // CustomButtons.cancelButton(
            //   context: context,
            //   nameController: widget.nameController,
            // ),
            // ButtonForSubCategories(
            //   scaffoldKey: widget.scaffoldKey,
            //   context: context,
            //   isNewSubcategory: widget.isNewSubcategory,
            //   nameController: widget.nameController,
            //   selectedCategory: _selectedCategory,
            //   previousCategory: widget.category,
            //   refreshFunction: widget.refreshFunction,
            //   selectedSubCategory: widget.selectedSubCategory,
            //   isCategoryWasChanged: _isCategoryWasChanged,
            //   // allItems: allItemsFromDB,
            //   refreshingOfItemsData: widget.refreshingOfItemsData,
            //   colorForSubCategory: selectedColor,
            //   iconOfSubCategory: selectedIcon,
            // ),
          ],
        ),
      ),
    );
  }

//
}
