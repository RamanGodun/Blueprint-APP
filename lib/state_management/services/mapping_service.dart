// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../Helpers/For_auth/dm_methods.dart';
import '../Providers/Providers_for_store/auth_profile_provider.dart';
import '../Providers/Providers_for_store/cart_provider.dart';
import '../Providers/Providers_for_store/common_data_provider.dart';

class MappingHelperService {
  final AuthProvider authProvider = GetIt.instance<AuthProvider>();
  final CartsProvider cartsProvider = GetIt.instance<CartsProvider>();
  final CommonDataProvider commonDataProvider =
      GetIt.instance<CommonDataProvider>();

  Future<void> exitFromApp() async {
    await authProvider.userSignOut();
    await authProvider.saveUserDataToSP();
    // nextScreenReplace(context, const MyApp(isNewUser: false));
  }

  Future<void> deleteProduct(String productId, bool isNewProductItem) async {
    if (!isNewProductItem) {
      await DMMethodsOnDB().deleteProductImageOnStorage(productId);
    }
    await DMMethodsOnDB()
        .removeProductOnFirebase(GetIt.instance<BuildContext>(), productId);
    commonDataProvider.removeProductItem(productId);
    // nextScreenReplace(context, AppTabs(bottomTab: 0, appBarIndex: widget.appBarIndex));
  }

  Future<void> adminOrderDelete(DateTime createdAt, String userId,
      int bonusRequest, bool isFinishedOrder) async {
    try {
      await DMMethodsOnDB().inAdminOrderSetIsNotVisible(
          createdAt, userId, bonusRequest, isFinishedOrder);
      await cartsProvider.fetchAdminOrders();
    } catch (error) {
      print("mistake during deleting of order by admin $error");
    }
  }

  void executeMapping(String key,
      {String? productId,
      bool? isNewProductItem,
      DateTime? createdAt,
      String? userId,
      int? bonusRequest,
      bool? isFinishedOrder}) {
    switch (key) {
      case 'exit from app':
        exitFromApp();
        break;
      case 'product\'s delete':
        if (productId != null && isNewProductItem != null) {
          deleteProduct(productId, isNewProductItem);
        }
        break;
      case 'admin\'s order delete':
        if (createdAt != null &&
            userId != null &&
            bonusRequest != null &&
            isFinishedOrder != null) {
          adminOrderDelete(createdAt, userId, bonusRequest, isFinishedOrder);
        }
        break;
      default:
        print('No matching key found for $key');
    }
  }
}
