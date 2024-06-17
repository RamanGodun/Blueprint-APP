import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import '../Models/app_enums.dart';
import '../Services/_service_locator.dart';
import 'dialogs_service.dart';

class AuthService extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CustomDialogService dialogService =
      DIServiceLocator.instance.get<CustomDialogService>();

  bool isLoading = false;

  Future<User?> signInWithGoogle() async {
    _setLoading(true);
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        _setLoading(false);
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await firebaseAuth.signInWithCredential(credential);
      _setLoading(false);
      return userCredential.user;
    } catch (error) {
      _setLoading(false);
      rethrow;
    }
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    _setLoading(true);
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _setLoading(false);
      return userCredential;
    } catch (error) {
      _setLoading(false);
      rethrow;
    }
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    _setLoading(true);
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _setLoading(false);
      return userCredential;
    } catch (error) {
      _setLoading(false);
      rethrow;
    }
  }

  Future<void> signUserInOrUp(
    BuildContext context,
    bool isLoginPage,
    Map<TextFields, String> textControllersValues,
  ) async {
    final email = textControllersValues[TextFields.email]!;
    final password = textControllersValues[TextFields.password]!;
    final confirmPassword =
        textControllersValues[TextFields.passwordConfirmation] ?? password;

    _setLoading(true);
    try {
      if (isLoginPage) {
        await signInWithEmailAndPassword(email, password);
      } else {
        if (password == confirmPassword) {
          await createUserWithEmailAndPassword(email, password);
        } else {
          _setLoading(false);
          dialogService.showErrorDialog(context, 'Passwords don\'t match');
          return;
        }
      }
      _setLoading(false);
    } catch (e) {
      _setLoading(false);
      dialogService.showErrorDialog(
          // ignore: use_build_context_synchronously
          context,
          'An error occurred. Please try again.');
    }
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
