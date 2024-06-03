// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../Models/models_for_store/profile_data_model.dart';

class DMMethodsOnDB {
  late FirebaseFirestore firestore;
  late CollectionReference profilesCollection;

  DMMethodsOnDB() {
    firestore = FirebaseFirestore.instance;
    profilesCollection = firestore.collection('Users/');
  }

  //
  //USER PROFILE DATA MANAGEMENT
  //
  Future<void> saveUserDataToFirebase({
    required String userId,
    required ProfileDataModel userProfileData,
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

  Future<ProfileDataModel?> getUserDataFromFirestore(String userId) async {
    try {
      final snapshotOfProfileData = await profilesCollection.doc(userId).get();

      if (snapshotOfProfileData.exists) {
        final data = snapshotOfProfileData.data() as Map<String, dynamic>;
        final userProfileData = ProfileDataModel.fromMap(data);
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

  Future<bool> getIsUserExist(String userId) async {
    try {
      DocumentSnapshot snapshot = await profilesCollection.doc(userId).get();
      return snapshot.exists;
    } catch (e) {
      // print('Помилка: $e');
      return false;
    }
  }

  Future<bool> isPhoneNumberExistsOnDB(String phoneNumber) async {
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
//
}
