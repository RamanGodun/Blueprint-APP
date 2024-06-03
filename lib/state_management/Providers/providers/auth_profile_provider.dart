// general
// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/models_for_store/profile_data_model.dart';
import '../../Src/Helpers/dm_methods.dart';
import '../../Src/Helpers/helpers.dart';

import '../../../Pages/Auth_pages/Auth_with_phone/otp_screen.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  //
  // VARS and getters for AuthProvider
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  //
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get isAdmin => firebaseAuth.currentUser?.phoneNumber == "+381234567890";
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  late String _nameOfAccount;
  ProfileDataModel? _userProfileData;
  ProfileDataModel get userProfileData => _userProfileData ?? newProfileModel();

  ProfileDataModel newProfileModel() {
    return ProfileDataModel(
      userId: firebaseAuth.currentUser!.uid,
      phoneNumber: firebaseAuth.currentUser!.phoneNumber,
      deliveryPhoneNumber: "",
      nameOfAccount: _nameOfAccount,
      fullName: "",
      userImageURL: "",
      userAddress: "",
      userPostOfficeData: "",
      selectedWayOfDelivery: "",
      bonuses: 0,
      ordersTotalSum: 0.0,
    );
  }

  //
  // methods FOR ENTERING LOGIC performing, SharedPreferences (SP) operations
  //

  // Future<User?> checkIsUserSignIn() async {
  //   final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  //   _isSignedIn = sharedPrefs.getBool("is_signedIn") ?? false;
  //   notifyListeners();

  //   if (_isSignedIn) {
  //     return FirebaseAuth.instance.currentUser;
  //   } else {
  //     return null;
  //   }
  // }

  Future<bool> checkIsUserExistingOnDB() async {
    final isUserExistOnDB =
        await DMMethodsOnDB().getIsUserExist(firebaseAuth.currentUser!.uid);
    return isUserExistOnDB;
  }

  Future<void> saveUserDataToSP() async {
    SharedPreferences sP = await SharedPreferences.getInstance();
    await sP.setString('account', _userProfileData!.nameOfAccount!);
    await sP.setString(
        'phoneNumber', _userProfileData!.phoneNumber!.substring(3));
    final String q = sP.getString('phoneNumber') ?? "phoneNumber is null";
    final String w = sP.getString('account') ?? "account is null";
    print(q);
    print(w);
    notifyListeners();
  }

  //
  // SIGNING IN/OUT methods
  //
  Future<bool> checkIsUserSignIn() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    _isSignedIn = sharedPrefs.getBool("is_signedIn") ?? false;
    notifyListeners();
    return _isSignedIn;
  }

  Future<void> setSignIn() async {
    _isSignedIn = true;
    final SharedPreferences sP = await SharedPreferences.getInstance();
    await sP.setBool("is_signedIn", true);
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
      BuildContext context, String phoneNumber, String? nameOfAccount) async {
    _userProfileData?.nameOfAccount = nameOfAccount ?? "";
    _userProfileData?.phoneNumber = phoneNumber;

    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (verificationId, forceResendingToken) {
          Helpers.push(context, OtpScreen(verificationId: verificationId));
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
      Helpers.showSnackBar(context, e.message.toString());
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
      Helpers.showSnackBar(context, e.message.toString());
    }
  }

//
// methods for PROFILE DATA MANAGING
//

  Future<void> saveUserDataToFirebase(
    bool isRegistration,
  ) async {
    _isLoading = true;
    notifyListeners();
    await DMMethodsOnDB().saveUserDataToFirebase1(
        // userId: userProfileData.userId,
        userId: firebaseAuth.currentUser!.uid,
        userProfileData: userProfileData,
        isRegistration: isRegistration);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getUserDataFromFirestore1() async {
    _isLoading = true;
    notifyListeners();
    final userProfileData = await DMMethodsOnDB()
        .getUserDataFromFirestore1(firebaseAuth.currentUser!.uid);
    if (userProfileData != null) {
      _userProfileData = userProfileData;
    }
    _isLoading = false;
    notifyListeners();
  }

  void updateProfileData({String? nameOfAccount, String? phoneNumber}) {
    if (phoneNumber != nameOfAccount) {
      _nameOfAccount = nameOfAccount!;
      _userProfileData?.nameOfAccount = _nameOfAccount;
    }
    if (phoneNumber != null) {
      _userProfileData?.phoneNumber = phoneNumber;
    }

    notifyListeners();
  }
  //
  //
}
