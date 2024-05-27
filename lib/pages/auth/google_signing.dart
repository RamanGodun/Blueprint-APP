// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

Future<User?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final userCredential = await firebaseAuth.signInWithCredential(credential);
  return userCredential.user;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Signed Out");
}
