import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../../State_management/Models/app_enums.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_category.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /item_model.dart';
import '../../../../State_management/Models/models_4_tracker_on_isar /model_of_subcategory.dart';
import '../../../../State_management/Providers/Provider_4_tracker/categories_provider.dart';
import '../../../../State_management/Helpers/For_tracker/category_helpers.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';
import '../../Text_fields/app_text_fields.dart';
import '../../Buttons/for_tracker/drop_button2.dart';
import '../../Buttons/for_tracker/sc_drop_button.dart';
import '../../Pickers/cupertino_date_picker.dart';
import '../../Switchers/for_tracker/measurement_unit_picker.dart';

class NewItemDialog extends StatefulWidget {
  const NewItemDialog({
    super.key,
    required this.nameController,
    required this.amountController,
    required this.quantityController,
    required this.measurementUnitController,
    required this.refreshFunction,
    this.item,
    this.isPurchase,
    this.isExpense,
    this.isNewPurchaseOnBaseOfBlueprint,
    required this.scaffoldKey,
  });

  final TextEditingController nameController;
  final TextEditingController amountController;
  final TextEditingController quantityController;
  final TextEditingController measurementUnitController;
  final VoidCallback refreshFunction;
  final ItemModel? item;
  final bool? isPurchase;
  final bool? isNewPurchaseOnBaseOfBlueprint;
  final bool? isExpense;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<NewItemDialog> createState() => _NewItemDialogState();
}

class _NewItemDialogState extends State<NewItemDialog> {
  DateTime selectedDate = DateTime.now();
  late Category _selectedCategory;
  late List<SubCategory> _subCategoriesOfSelectedCategory;
  late SubCategory _currentSubCategory;
  late ThemeData theme;
  late TextTheme textTheme;
  late Size deviceSize;
  late ValueNotifier<bool> isValid;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.item?.selectedCategory ??
        CategoriesProvider().kCategoriesData[CategoriesEnum.other]!;
    _subCategoriesOfSelectedCategory = CategoriesProvider().kSubCategoriesData[
        CategoriesHelper.categoryToEnum(_selectedCategory.title)]!;
    // _currentSubCategory = widget.item?.selectedSubCategory ??
    //     CategoriesProvider().kSubCategoriesData[
    //         CategoriesHelper.categoryToEnum(_selectedCategory.title)]![0];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ThemeData theme = Helpers.themeGet(context);
    textTheme = theme.textTheme;
    deviceSize = Helpers.deviceSizeGet(context);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = textTheme.displaySmall!
        .copyWith(color: Theme.of(context).colorScheme.onSurface);

    return Material(
      child: Padding(
        padding: EdgeInsets.only(bottom: deviceSize.height / 10),
        child: CupertinoAlertDialog(
          title: Text(
            (widget.isPurchase != null ||
                    widget.isNewPurchaseOnBaseOfBlueprint != null)
                ? AppStrings.addToPurchasesList
                : (widget.isExpense != null)
                    ? AppStrings.newExpense
                    : AppStrings.newBlueprint,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium,
          ),
          content: SingleChildScrollView(
            child: Column(
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
                      child: AppTextField(
                        controller: widget.nameController,
                        hintText:
                            (widget.isNewPurchaseOnBaseOfBlueprint != null)
                                ? widget.item!.name
                                : (widget.isExpense != null)
                                    ? AppStrings.inputExpenseName
                                    : (widget.isPurchase != null)
                                        ? AppStrings.inputPurchaseName
                                        : AppStrings.inputBlueprintName,
                        theme: theme,
                        isValid: isValid,
                        validatorType: ValidatorType.name,
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
                      child: AppTextField(
                        controller: widget.quantityController,
                        hintText:
                            (widget.isNewPurchaseOnBaseOfBlueprint != null)
                                ? widget.item!.quantity.toString()
                                : '1',
                        theme: theme,
                        isValid: isValid,
                        validatorType: ValidatorType.integer,
                        maxLength: 4,
                      ),
                    ),
                    //
                    const SizedBox(width: 20),
                    Text(AppStrings.measureUnit, style: labelStyle),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: 30,
                      child: AppTextField(
                        controller: widget.measurementUnitController,
                        hintText: "-",
                        theme: theme,
                        isValid: isValid,
                        maxLength: 3,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),

                const SizedBox(height: 15),
                MeasurementUnitPicker(
                  controller: widget.measurementUnitController,
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
                      child: AppTextField(
                        controller: widget.amountController,
                        hintText:
                            (widget.isNewPurchaseOnBaseOfBlueprint != null)
                                ? Helpers().formatAmount(widget.item!.amount)
                                : "0 ",
                        theme: theme,
                        isValid: isValid,
                        validatorType: ValidatorType.double,
                        maxLength: 10,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                //

                SizedBox(
                  width: deviceSize.width,
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
                            setState(() {
                              _selectedCategory = newCategory;
                              updateSubCategories(_selectedCategory);
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                SizedBox(
                  width: deviceSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(width: 4),
                      Text(AppStrings.subCategory, style: labelStyle),
                      const SizedBox(width: 5),
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
                            const Spacer(),
                            SizedBox(
                              height: 30,
                              child: DatePickerRow(
                                initialDate: selectedDate,
                                onDateChanged: (newDateTime) {
                                  setState(() {
                                    selectedDate = newDateTime;
                                  });
                                },
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      )
                    : const SizedBox(height: 1),
                const SizedBox(height: 8),
              ],
            ),
          ),
//
          actions: const [
            // CustomButtons.cancelButton(
            //   context: context,
            //   nameController: widget.nameController,
            //   quantityController: widget.quantityController,
            //   amountController: widget.amountController,
            //   measurementUnitController: widget.measurementUnitController,
            // ),
            // CustomButtons.saveItemButton(
            //   context: context,
            //   item: widget.item,
            //   nameController: widget.nameController,
            //   quantityController: widget.quantityController,
            //   amountController: widget.amountController,
            //   measurementUnitController: widget.measurementUnitController,
            //   selectedDate:
            //       (widget.isExpense != null) ? selectedDate : DateTime.now(),
            //   refreshFunction: widget.refreshFunction,
            //   isPurchase: (widget.isPurchase != null ||
            //           widget.isNewPurchaseOnBaseOfBlueprint != null)
            //       ? true
            //       : false,
            //   isBlueprint: (widget.isPurchase != null ||
            //           widget.isNewPurchaseOnBaseOfBlueprint != null ||
            //           widget.isExpense != null)
            //       ? false
            //       : true,
            //   isPurchaseOnBaseOnBlueprint:
            //       (widget.isNewPurchaseOnBaseOfBlueprint != null)
            //           ? true
            //           : false,
            //   selectedCategory: _selectedCategory,
            //   selectedSubCategory: _currentSubCategory,
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

  void validateInput(TextEditingController controller) {
    isValid.value = controller.text.isNotEmpty;
  }
//
}
