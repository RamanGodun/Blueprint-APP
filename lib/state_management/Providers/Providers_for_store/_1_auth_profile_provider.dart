// ignore_for_file: avoid_print, use_build_context_synchronously, unused_catch_clause

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_storage/firebase_storage.dart';

import '../../Models/models_for_store/profile_data_model.dart';
import '../../Src/Helpers/dm_methods.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  //
  // VARS and getters for ProfileProvider
  //

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  //
  bool get isAdmin => firebaseAuth.currentUser?.phoneNumber == "+381234567890";
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  UserDataModel? _userProfileData;
  UserDataModel get userProfileData => _userProfileData ?? newProfileModel();

  UserDataModel newProfileModel() {
    return UserDataModel(
      userId: firebaseAuth.currentUser!.uid,
      userFullName: "",
      userAccountName: "",
      userPhoneNumber: firebaseAuth.currentUser!.phoneNumber,
      userPhoneNumberForDelivery: "",
      userImageURL: "",
      userPostOfficeData: "",
      userAddress: "",
      userSelectedWayOfDelivery: "",
      comments: "",
      userBonuses: 0,
      usersSumOfAllOrders: 0.0,
    );
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //
  // methods FOR ENTERING LOGIC performing, SharedPreferences (SP) operations
  //

  Future<bool> checkIsUserExistingOnDB() async {
    final isUserExistOnDB =
        await DMMethodsOnDB().getIsUserExist(firebaseAuth.currentUser!.uid);
    return isUserExistOnDB;
  }

  Future<void> checkIsUserSignIn() async {
    final SharedPreferences sP = await SharedPreferences.getInstance();
    _isSignedIn = sP.getBool("is_signedIn") ?? false;
    // await getDataFromSP();
    notifyListeners();
  }

  Future<void> saveUserDataToSP() async {
    SharedPreferences sP = await SharedPreferences.getInstance();
    if (_userProfileData != null) {
      await sP.setString(
          "ProfileInfoModel", jsonEncode(_userProfileData!.toMap()));
    } else {
      print('ProfileInfoModel is empty, cannot save data to SharedPreferences');
    }
    // get rid of it in the future
    if (_userProfileData?.userAccountName?.isNotEmpty == true &&
        _userProfileData?.userPhoneNumber?.isNotEmpty == true) {
      await sP.setString('account', _userProfileData!.userAccountName!);
      await sP.setString('phoneNumber', _userProfileData!.userPhoneNumber!);
    }
  }

  // Future<void> getDataFromSP() async {
  //   try {
  //     SharedPreferences sP = await SharedPreferences.getInstance();
  //     String data = sP.getString("ProfileInfoModel") ?? '';
  //     if (data.isNotEmpty) {
  //       var jsonData = jsonDecode(data);
  //       _userProfileData = ProfileInfoModel.fromMap(jsonData);
  //       notifyListeners();
  //     } else {
  //       print('No data in SharedPreferences');
  //     }
  //   } catch (e) {
  //     print('Error getting data from SharedPreferences: $e');
  //   }
  // }

  //
  // SIGNING IN/OUT methods
  //

  Future<void> setSignIn() async {
    _isSignedIn = true;
    final SharedPreferences s = await SharedPreferences.getInstance();
    await s.setBool("is_signedIn", true);
    s.setBool('isNewUser', false);
    notifyListeners();
  }

  Future<void> userSignOut() async {
    await firebaseAuth.signOut();
    SharedPreferences sP = await SharedPreferences.getInstance();
    await sP.setBool("is_signedIn", false);
    saveUserDataToSP();
    notifyListeners();
  }

  //
  // Methods for AUTHORIZATION
  //

  Future<void> signInWithPhone(
      BuildContext context, String phoneNumber, String? userName) async {
    try {
      _userProfileData?.userAccountName = userName ?? "";
      _userProfileData?.userPhoneNumber = phoneNumber;
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (verificationId, forceResendingToken) {
          // nextScreen(context, OtpScreen(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
      );
    } on FirebaseAuthException catch (e) {
//       // showSnackbar(context, content: e.message.toString());
    }
  }

  Future<void> verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    try {
      if (_isSignedIn) {
        await onSuccess();
      } else {
        PhoneAuthCredential credentials = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: userOtp);

        User? user =
            (await firebaseAuth.signInWithCredential(credentials)).user;
        if (user != null) {
          onSuccess();
        }
      }
    } on FirebaseAuthException catch (e) {
      // showSnackbar(context, content: e.message.toString());
    }
  }

//
// methods for PROFILE DATA MANAGING
//

  void updateProfileData(
      {String? newPersonalId,
      String? newPhoneNumber,
      String? newTown,
      String? newDeliveryPoint,
      String? newComments,
      String? newPersonalNickName,
      String? newDeliveryMethod,
      int? newAmountOfBonuses}) {
    if (newPersonalId != null) {
      _userProfileData?.userFullName = newPersonalId;
    }
    if (newPhoneNumber != null) {
      _userProfileData?.userPhoneNumberForDelivery = newPhoneNumber;
    }
    if (newTown != null) {
      _userProfileData?.userAddress = newTown;
    }
    if (newDeliveryPoint != null) {
      _userProfileData?.userPostOfficeData = newDeliveryPoint;
    }
    if (newComments != null) {
      _userProfileData?.comments = newComments;
    }
    if (newPersonalNickName != null) {
      _userProfileData?.userAccountName = newPersonalNickName;
    }
    if (newDeliveryMethod != null) {
      _userProfileData?.userSelectedWayOfDelivery = newDeliveryMethod;
    }
    if (newAmountOfBonuses != null) {
      _userProfileData?.userBonuses = newAmountOfBonuses;
    }
    notifyListeners();
  }

  Future<void> saveUserDataToFirebase(
    bool isNewUser,
  ) async {
    _isLoading = true;
    notifyListeners();
    await DMMethodsOnDB().saveUserDataToFirebase(
        userId: userProfileData.userId,
        userProfileData: userProfileData,
        isNewUser: isNewUser);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getUserDataFromFirestore() async {
    _isLoading = true;
    notifyListeners();
    final userProfileData = await DMMethodsOnDB()
        .getUserDataFromFirestore(firebaseAuth.currentUser!.uid);
    if (userProfileData != null) {
      _userProfileData = userProfileData;
    }
    _isLoading = false;
    notifyListeners();
  }

  //
  //
}
