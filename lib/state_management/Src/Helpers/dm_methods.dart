// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../Models/_0_models.dart';
import '../../Models/models_for_store/cart_item_model.dart';
import '../../Models/models_for_store/cashback_model.dart';
import '../../Models/models_for_store/product_model.dart';
import '../../Models/models_for_store/profile_data_model.dart';
import '../../Providers/Providers_for_store/_1_common_data_provider.dart';

class DMMethodsOnDB {
  late FirebaseFirestore firestore;
  late CollectionReference profilesCollection;
  late CollectionReference productsCollection;
  late CollectionReference generalInfoCollection;
  late CollectionReference ordersCollection;

  DMMethodsOnDB() {
    firestore = FirebaseFirestore.instance;
    profilesCollection = firestore.collection('Users/');
    productsCollection = firestore.collection('Products/');
    generalInfoCollection = firestore.collection('General/');
    ordersCollection = firestore.collection('Orders/');
  }

  //
  //USER PROFILE DATA MANAGEMENT
  //
  Future<void> saveUserDataToFirebase1({
    required String userId,
    required UserDataModel userProfileData,
    required bool isRegistration,
  }) async {
    try {
      if (isRegistration) {
        await profilesCollection
            .doc(userId)
            .set(userProfileData.toMap())
            .then((value) {});
      } else {
        await profilesCollection
            .doc(userId)
            .update(userProfileData.toMap())
            .then((value) {});
      }
    } catch (error) {
      return;
    }
  }

  Future<UserDataModel?> getUserDataFromFirestore1(String userId) async {
    try {
      final snapshotOfProfileData = await profilesCollection.doc(userId).get();

      if (snapshotOfProfileData.exists) {
        final data = snapshotOfProfileData.data() as Map<String, dynamic>;
        final userProfileData = UserDataModel.fromMap(data);
        return userProfileData;
      } else {
        // print('Такого профілю не існує');
        return null;
      }
    } catch (error) {
      // print('Помилка при отриманні даних з БД: $error');
      return null;
    }
  }

  Future<bool> getIsUserExist1(String userId) async {
    try {
      DocumentSnapshot snapshot = await profilesCollection.doc(userId).get();
      return snapshot.exists;
    } catch (e) {
      // print('Помилка: $e');
      return false;
    }
  }

  Future<bool> isPhoneNumberExistsOnDB1(String phoneNumber) async {
    try {
      QuerySnapshot querySnapshot = await profilesCollection
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      final bool isPhoneNumberExistsOnDB = querySnapshot.docs.isNotEmpty;
      print("number exist is ... $isPhoneNumberExistsOnDB");
      return isPhoneNumberExistsOnDB;
    } catch (e) {
      return false;
    }
  }

//
  static Future<bool> checkInternetConnectivity(BuildContext context) async {
    final scaffoldContext = ScaffoldMessenger.of(context);
    final connectivityResult = await Connectivity().checkConnectivity();
    // ignore: unrelated_type_equality_checks
    final hasInternetConnection = connectivityResult != ConnectivityResult.none;

    if (!hasInternetConnection) {
      scaffoldContext.showSnackBar(const SnackBar(
        content: Text('Немає з\'єднання з Інтернетом'),
        duration: Duration(seconds: 3),
      ));
    }
    return hasInternetConnection;
  }

// code for STREAM BUILDER realization
  Stream<List<CartItem>> getAdminOrdersStream() {
    return ordersCollection
        .where("isVisible4Admin", isEqualTo: true)
        .snapshots()
        .map((snapshot) => _cartItemsFromSnapshot(snapshot));
  }

  List<CartItem> _cartItemsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => CartItem.fromMap(doc.data()! as Map<String, dynamic>))
        .toList();
  }
//

//
// methods for ADDING/UPDATING of common/general data on the DataBase
// (...NEED TO OPTIMIZE, to unit in one the same methods...)
//

  Future<void> updateGeneralInfoOnFirebase(
      BuildContext context, AdminDataModel generalInfoData) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('General/')
          .doc('general data')
          .get();

      if (docSnapshot.exists) {
        try {
          await generalInfoCollection
              .doc("general data")
              .update(generalInfoData.toMap());
          // showSnackbar(context, content: 'Інформацію успішно оновлено!');
        } catch (e) {
          // showSnackbar(context,
          // content: 'Помилка при оновленні інформації: $e');
        }
      } else {
        try {
          await generalInfoCollection
              .doc("general data")
              .set(generalInfoData.toMap());
          // showSnackbar(context, content: 'Інформацію успішно додано!');
        } catch (e) {
          // showSnackbar(context,
          // content: 'Помилка при додаванні інформації: $e');
        }
      }
    } catch (e) {
      // showSnackbar(context, content: 'Помилка: $e');
    }
  }

  Future<void> updateSellerPointsInfoOnFirebase(
      BuildContext context, SellerPointsInfo sellerPointsInfo) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('General/')
          .doc('дані щодо точок продажу')
          .get();

      if (docSnapshot.exists) {
        try {
          await generalInfoCollection
              .doc("дані щодо точок продажу")
              .update(sellerPointsInfo.toMap());
          // showSnackbar(context, content: 'Інформацію успішно оновлено!');
        } catch (e) {
          // showSnackbar(context,
          // content: 'Помилка при оновленні інформації: $e');
        }
      } else {
        try {
          await generalInfoCollection
              .doc("дані щодо точок продажу")
              .set(sellerPointsInfo.toMap());
          // showSnackbar(context, content: 'Інформацію успішно додано!');
        } catch (e) {
          // showSnackbar(context,
          // content: 'Помилка при додаванні інформації: $e');
        }
      }
    } catch (e) {
      // showSnackbar(context, content: 'Помилка: $e');
    }
  }

  Future<void> updateBonusSystemOnFirebase(
      BuildContext context, BonusSystem bonusSystem) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('General/')
          .doc('система скидок')
          .get();

      if (docSnapshot.exists) {
        try {
          await generalInfoCollection
              .doc("система скидок")
              .update(bonusSystem.toMap());
          // showSnackbar(context, content: 'Інформацію успішно оновлено!');
        } catch (e) {
          // showSnackbar(context,
          // content: 'Помилка при оновленні інформації: $e');
        }
      } else {
        try {
          await generalInfoCollection
              .doc("система скидок")
              .set(bonusSystem.toMap());
          // showSnackbar(context, content: 'Інформацію успішно додано!');
        } catch (e) {
          // showSnackbar(context,
          // content: 'Помилка при додаванні інформації: $e');
        }
      }
    } catch (e) {
      // showSnackbar(context, content: 'Помилка: $e');
    }
  }

  Future<void> saveGeneralDataToFirebase(AdminDataModel generalData) async {
    try {
      await generalInfoCollection.doc('general data').set(generalData.toMap());
      print('General data saved successfully');
    } catch (error) {
      print('Error saving general data: $error');
      return;
    }
  }

// Метод оновлення поля "profilePicture"/"CertificateUrl" в базі даних
  Future<void> updateProfileOrCertificatePictureURLonDB({
    BuildContext? context,
    String? userId,
    String? newPictureURL,
    bool? isProfilePicture,
    bool? isAdmin,
  }) async {
    try {
      // Оновити документ з відповідним userId в Firestore
      if (isProfilePicture == true) {
        if (newPictureURL != null) {
          await firestore
              .collection('Profiles/')
              .doc(userId)
              .update({'profilePicture': newPictureURL});
          // showSnackbar(context!, content: 'Зображення профілю оновлено!');
          if (isAdmin == true) {
            await firestore
                .collection('General/')
                .doc("general data")
                .update({'adminPicture': newPictureURL});
          }
        }
      } else {
        if (newPictureURL != null) {
          await firestore
              .collection('General/')
              .doc("general data")
              .set({'certificateURL': newPictureURL});
          // showSnackbar(context!, content: 'Зображення сертифікату оновлено!');
        }
      }
    } catch (e) {
      // showSnackbar(context!,
      //     color: Colors.red, content: 'Помилка при оновленні зображення: $e');
    }
  }

// метод додавання/оновлення продукту на базі даних
  Future<void> addProduct2Firebase(BuildContext context,
      ProductModel newProductItem, bool needSnackbar) async {
    try {
      await productsCollection
          .doc(newProductItem.id)
          .set(newProductItem.toMap());
      // needSnackbar
      //     ? showSnackbar(context, content: 'Продукт успішно доданий!')
      //     : null;
    } catch (e) {
      // showSnackbar(context, content: 'Помилка при додаванні продукту: $e');
    }
  }

  Future<void> updateProductOnFirebase(BuildContext context, String productId,
      ProductModel? editedProductItem) async {
    try {
      await productsCollection
          .doc(editedProductItem!.id)
          .update(editedProductItem.toMap());
      // showSnackbar(context, content: 'Продукт успішно оновлено!');
    } catch (e) {
      // showSnackbar(context, content: 'Помилка при оновленні товару: $e');
    }
  }

//
// DELETING of PRODUCT from DataBase
//
  Future<void> removeProductOnFirebase(
      BuildContext context, String productID) async {
    try {
      await productsCollection.doc(productID).delete();
      // showSnackbar(context, content: "продукт був видалений з БД");
    } catch (e) {
      // showSnackbar(context, content: "Помилка при видаленні товару на БД: $e");
    }
  }

//
// Methods for FETCHING of data FROM DB
//

  Future<SellerPointsInfo?> fetchSellerPointsInfoFromFirestore() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('General/')
          .doc('дані щодо точок продажу')
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        final sellerPointsInfo = SellerPointsInfo.fromMap(data);
        return sellerPointsInfo;
      } else {
        return null;
      }
    } catch (error) {
      print("Error fetching seller points info: $error");
      return null;
    }
  }

  Future<BonusSystem?> fetchBonusSystemFromFirestore() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('General/')
          .doc('система скидок')
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        final bonusSystem = BonusSystem.fromMap(data);
        return bonusSystem;
      } else {
        return null;
      }
    } catch (error) {
      print("Error fetching bonus system info: $error");
      return null;
    }
  }

  Future<AdminDataModel?> fetchGeneralDataFromFirestore() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('General/')
          .doc('general data')
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        final generalData = AdminDataModel.fromMap(data);
        return generalData;
      } else {
        return null;
      }
    } catch (error) {
      print("Error fetching general data info: $error");
      return null;
    }
  }

  Future<List<CartItem>> fetchUserOrders(String currentUserId) async {
    try {
      final userOrdersQuery =
          await ordersCollection.where("id", isEqualTo: currentUserId).get();

      final userOrders = userOrdersQuery.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return CartItem.fromMap(data);
      }).toList();

      return userOrders;
    } catch (error) {
      print("Error fetching user orders: $error");
      return [];
    }
  }

  Future<List<CartItem>> fetchAdminOrders() async {
    try {
      final userOrdersQuery = await ordersCollection
          .where("isVisible4Admin", isEqualTo: true)
          .get();

      final userOrders = userOrdersQuery.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return CartItem.fromMap(data);
      }).toList();

      return userOrders;
    } catch (error) {
      print("Error fetching user orders: $error");
      return [];
    }
  }

  Future<List<ProductModel>> fetchProductsFromFirestore() async {
    try {
      final querySnapshotOfProducts = await productsCollection.get();

      final List<ProductModel> loadedProducts = querySnapshotOfProducts.docs
          .map(
              (doc) => ProductModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return loadedProducts;
    } catch (error) {
      print("Error fetching products from Firestore: $error");
      return [];
    }
  }
// example of unified method
  // Future<T?> fetchDataFromFirestore<T>(
  //     String collectionPath, String documentId) async {
  //   try {
  //     final docSnapshot =
  //         await firestore.collection(collectionPath).doc(documentId).get();

  //     if (docSnapshot.exists) {
  //       final data = docSnapshot.data() as Map<String, dynamic>;
  //       final result = _mapDataToType<T>(data);
  //       return result;
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     print("Error fetching data from Firestore: $error");
  //     return null;
  //   }
  // }

  // T? _mapDataToType<T>(Map<String, dynamic> data) {
  //   if (T == SellerPointsInfo) {
  //     return SellerPointsInfo.fromMap(data) as T?;
  //   } else if (T == BonusSystem) {
  //     return BonusSystem.fromMap(data) as T?;
  //   } else if (T == GeneralInfoData) {
  //     return GeneralInfoData.fromMap(data) as T?;
  //   } else if (T == CartItem) {
  //     return CartItem.fromMap(data) as T?;
  //   } else if (T == ProductModel) {
  //     return ProductModel.fromMap(data) as T?;
  //   } else {
  //     return null;
  //   }
  // }

//
// Methods for PICTURES management
  // Метод для збереження обраної картинки на Firebase Storage і отримання посилання на цю картинку

  Future<String?> uploadImageToStorage(
      {File? selectedFile4DB,
      String? fileNameOnStorage,
      bool? isProduct,
      bool? isCertificate}) async {
    if (selectedFile4DB == null) {
      return null;
    }
    try {
      // Створюємо посилання до Firebase Storage
      final firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;
      final String fileName = (isProduct == true)
          ? '/Products pictures/$fileNameOnStorage.jpg'
          : (isProduct == false && isCertificate == false)
              ? '/Profiles/$fileNameOnStorage.jpg'
              : (isProduct == false && isCertificate == true)
                  ? '/$fileNameOnStorage.jpg'
                  : "not specified name";
      final firebase_storage.Reference ref = storage.ref().child(fileName);

      // Завантажуємо файл на Firebase Storage
      final firebase_storage.UploadTask uploadTask =
          ref.putFile(selectedFile4DB);
      final firebase_storage.TaskSnapshot snapshot =
          await uploadTask.whenComplete(() => null);

      // Отримуємо посилання на завантажений файл, Повертаємо посилання на збережену картинку
      final String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
      //
    } catch (e) {
      print('Помилка при завантаженні зображення на Firebase Storage: $e');
      return null;
    }
  }

  // Метод для отримання посилання на рисунок з Firebase Storage за його назвою
  Future<String?> getDownloadURLForImage(
      String imageFileName, bool isProductPicture, bool isCertificate) async {
    try {
      // Створюємо посилання до Firebase Storage
      final firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;
      final firebase_storage.Reference ref = (isCertificate)
          ? storage.ref("/Certificate.jpg")
          : (isProductPicture)
              ? storage.ref("/Products pictures/").child("$imageFileName.jpg")
              : storage.ref("/Profiles/").child("$imageFileName.jpg");

      // Перевіряємо, чи існує об'єкт в Firebase Storage
      bool exists = false;
      try {
        await ref.getMetadata();
        exists = true;
      } catch (e) {
        print('Об\'єкт не існує в Firebase Storage: $e');
      }

      if (exists) {
        // Отримуємо посилання на рисунок
        final String downloadURL = await ref.getDownloadURL();
        return downloadURL;
      } else {
        print('Об\'єкт не існує в Firebase Storage.');
        return null;
      }
    } catch (e) {
      print('Помилка при отриманні посилання на зображення: $e');
      return null;
    }
  }

  Future<void> deleteProductImageOnStorage(String imageFileName) async {
    try {
      // final firebase_storage.FirebaseStorage storage =
      //     firebase_storage.FirebaseStorage.instance;
      // final firebase_storage.Reference storageReference =
      //     storage.ref("/Products pictures/").child("$imageFileName.jpg");
      // await storageReference.delete();
      print('Зображення успішно видалено');
    } catch (e) {
      print('Помилка під час видалення зображення: $e');
    }
  }

//
// Methods for ADMIN for managing of ORDERS
//
  Future<void> inAdminOrderSetIsNotVisible(DateTime createdAt, String userId,
      int bonusRequest, bool isFinishedOrder) async {
    String formattedCreatedAt =
        DateFormat("yyyy-MM-dd HH:mm").format(createdAt);
    String documentName4AdminOrder = "${formattedCreatedAt}_$userId";
    // making order not visible 4 admin
    try {
      final editingOrderQuery =
          await ordersCollection.doc(documentName4AdminOrder).get();
      if (editingOrderQuery.exists) {
        await ordersCollection.doc(documentName4AdminOrder).update({
          "isVisible4Admin": false,
        });
        // return not used bonuses 4 user
        if (bonusRequest != 0 && isFinishedOrder == false) {
          try {
            final profileDoc = await profilesCollection.doc(userId).get();
            if (profileDoc.exists) {
              Map<String, dynamic>? profileData =
                  profileDoc.data() as Map<String, dynamic>?;
              int userCurrentAmountOfBonuses =
                  profileData?['amountOfBonuses'] ?? 0;
              int newUserCurrentAmountOfBonuses =
                  userCurrentAmountOfBonuses + bonusRequest;
              await profilesCollection.doc(userId).update({
                "amountOfBonuses": newUserCurrentAmountOfBonuses,
              });
            } else {
              print("Profile document not found for user: $userId");
            }
          } catch (error) {
            print("Error updating bonuses amount: $error");
          }
        }
      } else {
        print("Document does not exist");
      }
    } catch (error) {
      print("Error finding or updating edited order for admin: $error");
    }
  }

  Future<void> inAdminOrderSetIsFinished(
      BuildContext context, DateTime createdAt, String userId) async {
    String formattedCreatedAt =
        DateFormat("yyyy-MM-dd HH:mm").format(createdAt);
    String documentName4AdminOrder = "${formattedCreatedAt}_$userId";

    try {
      final editingOrderQuery =
          await ordersCollection.doc(documentName4AdminOrder).get();
      if (editingOrderQuery.exists) {
        double totalSumOfCurrentOrder = editingOrderQuery.get("totalSum");
        //
        final editingOrderUserData = await profilesCollection.doc(userId).get();
        double totalSumOfOrders = editingOrderUserData.get("totalSumOfOrders");
        double cashbackAmount = Provider.of<CommonDataProvider>(context)
            .findCashbackPercentageAmount(totalSumOfOrders);
        int calculatedBonusesForCurrentOrder =
            (cashbackAmount * totalSumOfCurrentOrder ~/ 100);

        //

        await profilesCollection.doc(userId).update({
          "totalSumOfOrders": FieldValue.increment(totalSumOfCurrentOrder),
          "amountOfBonuses":
              FieldValue.increment(calculatedBonusesForCurrentOrder),
        });
        //

        await ordersCollection
            .doc(documentName4AdminOrder)
            .update({"isFinished": true});

        print("isFinished updated successfully");
      } else {
        print("Document does not exist");
      }
    } catch (error) {
      print("Error finding or updating order: $error");
    }
  }

  //
  //USER PROFILE DATA MANAGEMENT
  //
  Future<void> saveUserDataToFirebase({
    required String userId,
    required UserDataModel userProfileData,
    required bool isNewUser,
  }) async {
    try {
      if (isNewUser) {
        await profilesCollection
            .doc(userId)
            .set(userProfileData.toMap())
            .then((value) {
          print('User data added successfully');
        });
      } else {
        await profilesCollection
            .doc(userId)
            .update(userProfileData.toMap())
            .then((value) {
          print('User data updated successfully');
        });
      }
    } catch (error) {
      print('Error saving user data: $error');
      return;
    }
  }

  Future<UserDataModel?> getUserDataFromFirestore(String userId) async {
    try {
      final snapshotOfProfileData = await profilesCollection.doc(userId).get();

      if (snapshotOfProfileData.exists) {
        final data = snapshotOfProfileData.data() as Map<String, dynamic>;
        final userProfileData = UserDataModel.fromMap(data);
        return userProfileData;
      } else {
        print('Profile document does not exist');
        return null;
      }
    } catch (error) {
      print('Error getting user data from Firestore: $error');
      return null;
    }
  }

  // next two need to unify
  Future<bool> getIsUserExist(String userId) async {
    try {
      DocumentSnapshot snapshot = await profilesCollection.doc(userId).get();
      return snapshot.exists;
    } catch (e) {
      print('Помилка: $e');
      return false;
    }
  }

  Future<bool> isPhoneNumberExistsOnDB(String phone) async {
    try {
      QuerySnapshot snapshot =
          await profilesCollection.where('phoneNumber', isEqualTo: phone).get();
      return snapshot.docs.isNotEmpty;
    } catch (e) {
      print('Помилка: $e');
      return false;
    }
  }

//
}
