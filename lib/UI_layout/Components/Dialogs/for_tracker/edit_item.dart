import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../../State_management/Models/app_enums.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_category.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_subcategory.dart';
import '../../../../State_management/Providers/Provider_4_tracker/categories_provider.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../../../State_management/Helpers/For_tracker/category_helpers.dart';
import '../../_Widgets_STYLING/_textfield_styling.dart';
import '../../Buttons/for_tracker/drop_button2.dart';
import '../../Buttons/for_tracker/sc_drop_button.dart';
import '../../Pickers/cupertino_date_picker.dart';
import '../../Switchers/for_tracker/measurement_unit_picker.dart';

class EditItemDialog extends StatefulWidget {
  const EditItemDialog({
    super.key,
    required this.nameController,
    required this.amountController,
    required this.quantityController,
    required this.measurementUnitController,
    required this.refreshFunction,
    required this.item,
    this.isPurchase,
    this.isBlueprint,
    this.isExpense,
    required this.scaffoldKey,
  });

  final TextEditingController nameController;
  final TextEditingController amountController;
  final TextEditingController quantityController;
  final TextEditingController measurementUnitController;
  final VoidCallback refreshFunction;
  final ItemModel item;
  final bool? isPurchase;
  final bool? isBlueprint;
  final bool? isExpense;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<EditItemDialog> createState() => _EditItemDialogState();
}

class _EditItemDialogState extends State<EditItemDialog> {
  late DateTime selectedDate;
  late Category _selectedCategory;
  late List<SubCategory> _subCategoriesOfSelectedCategory;
  late SubCategory _currentSubCategory;

  @override
  void initState() {
    _selectedCategory = widget.item.selectedCategory ??
        CategoriesProvider().kCategoriesData[CategoriesEnum.other]!;
    _subCategoriesOfSelectedCategory = CategoriesProvider().kSubCategoriesData[
        CategoriesHelper.categoryToEnum(_selectedCategory.title)]!;
    _currentSubCategory =
        // widget.item.selectedSubCategory ??
        _subCategoriesOfSelectedCategory[0];
    selectedDate = widget.item.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Helpers.textTheme(context);
    TextStyle labelStyle = textTheme.displaySmall!
        .copyWith(color: Theme.of(context).colorScheme.onSurface);

    return Material(
      child: Padding(
        padding: EdgeInsets.only(bottom: Helpers.deviceHeight(context) / 10),
        child: CupertinoAlertDialog(
          title: Text(
            (widget.isPurchase != null)
                ? AppStrings.editList
                : (widget.isBlueprint != null)
                    ? AppStrings.editBlueprint
                    : AppStrings.editExpense,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 4),
                  Text(
                    AppStrings.nameText,
                    style: labelStyle,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DialogStyling.cupertinoTextField(
                      controller: widget.nameController,
                      placeholder: widget.item.name,
                      context: context,
                      isText: true,
                      maxLength: 25,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 4),
                  Text(AppStrings.quantity, style: labelStyle),
                  const SizedBox(width: 4),
                  SizedBox(
                    width: 38,
                    child: DialogStyling.cupertinoTextField(
                      controller: widget.quantityController,
                      placeholder: widget.item.quantity.toString(),
                      context: context,
                      isText: false,
                      maxLength: 4,
                    ),
                  ),
                  //
                  const SizedBox(width: 20),
                  Text(AppStrings.measureUnit, style: labelStyle),
                  const SizedBox(width: 4),
                  Expanded(
                    child: DialogStyling.cupertinoTextField(
                      controller: widget.measurementUnitController,
                      placeholder: widget.item.measurementUnit,
                      context: context,
                      isText: true,
                      maxLength: 3,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 15),
              MeasurementUnitPicker(
                isFromEditDialog: true,
                controller: widget.measurementUnitController,
                text: widget.item.measurementUnit,
                context: context,
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${AppStrings.costText}${AppStrings.localCurrencySymbol}   ",
                    style: labelStyle,
                  ),
                  Expanded(
                    child: DialogStyling.cupertinoTextField(
                      controller: widget.amountController,
                      placeholder: "",
                      // placeholder: widget.item.amount.toString(),
                      context: context,
                      isText: false,
                      maxLength: 10,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 8),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 4),
                    Text(AppStrings.category, style: labelStyle),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: DropButton(
                        item: widget.item,
                        onCategoryChanged: (newCategory) {
                          setState(
                            () {
                              _selectedCategory = newCategory;
                              updateSubCategories(_selectedCategory);
                            },
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              //
              const SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 4),
                    Text(AppStrings.subCategory, style: labelStyle),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: SubCategoryDropButton(
                        item: widget.item,
                        subCategoriesOfSelectedCategory:
                            _subCategoriesOfSelectedCategory,
                        currentSubCategory: _currentSubCategory,
                        onSubCategoryChanged: (newSubCategory) {
                          setState(() {
                            _currentSubCategory = newSubCategory;
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              if (widget.isExpense != null) const SizedBox(height: 4),
              (widget.isExpense != null)
                  ? SizedBox(
                      height: 27,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(width: 4),
                          Text(AppStrings.date, style: labelStyle),
                          const SizedBox(width: 10),
                          DatePickerRow(
                            initialDate: selectedDate,
                            onDateChanged: (newDateTime) {
                              setState(() {
                                selectedDate = newDateTime;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(height: 5),
              const SizedBox(height: 5),
            ],
          ),
          // BUTTONS
          actions: const [
            // CustomButtons.cancelButton(
            //   context: context,
            //   nameController: widget.nameController,
            //   quantityController: widget.quantityController,
            //   amountController: widget.amountController,
            //   measurementUnitController: widget.measurementUnitController,
            // ),
            // CustomButtons.editItemButton(
            //   context: context,
            //   nameController: widget.nameController,
            //   quantityController: widget.quantityController,
            //   amountController: widget.amountController,
            //   measurementUnitController: widget.measurementUnitController,
            //   item: widget.item,
            //   selectedCategory: _selectedCategory,
            //   selectedSubCategory: _currentSubCategory,
            //   selectedDate:
            //       (widget.isExpense != null) ? selectedDate : DateTime.now(),
            //   refreshFunction: widget.refreshFunction,
            //   isPurchase: (widget.isPurchase != null) ? true : false,
            //   isBlueprint: widget.isBlueprint ?? false,
            //   scaffoldKey: widget.scaffoldKey,
            // ),
          ],
        ),
      ),
    );
  }

  void updateSubCategories(Category newCategory) {
    setState(() {
      _currentSubCategory = CategoriesProvider().kSubCategoriesData[
          CategoriesHelper.categoryToEnum(newCategory.title)]![0];
      _subCategoriesOfSelectedCategory =
          CategoriesProvider().kSubCategoriesData[
              CategoriesHelper.categoryToEnum(newCategory.title)]!;
    });
  }
//
}
