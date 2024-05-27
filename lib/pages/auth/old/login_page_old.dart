// // ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison, avoid_print

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginPage extends StatefulWidget {
//   // static const routeName = '/';
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   Future<void> _handleSignIn() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser!.authentication;
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // ignore: unused_local_variable
//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);
//       context.pushNamed('StartPage');
//     } catch (error) {
//       print('Sign in error: $error');
//     }
//   }

//   void _signInWithEmailAndPassword() async {
//     try {
//       final user = await _auth.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       if (user != null) {
//         context.pushNamed('StartPage');
//       }
//     } catch (e) {
//       // print(e);
//     }
//   }

//   void _createAccountWithEmailAndPassword() async {
//     try {
//       final newUser = await _auth.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       if (newUser != null) {
//         context.pushNamed('StartPage');
//       }
//     } catch (e) {
//       // print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login / Register')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: _signInWithEmailAndPassword,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Theme.of(context).colorScheme.secondary,
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: _createAccountWithEmailAndPassword,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Theme.of(context).colorScheme.primary,
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text('Register'),
//             ),
//             ElevatedButton(
//               onPressed: _handleSignIn,
//               style: ElevatedButton.styleFrom(
//                   foregroundColor: Theme.of(context).colorScheme.secondary),
//               child: const Text('Sign in with Google'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
