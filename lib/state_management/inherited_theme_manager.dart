// import 'package:flutter/material.dart';
// import '../src/helpers/my_change_notifier_provider.dart';
// import 'theme_provider.dart';

// class InheritedThemeManager extends StatefulWidget {
//   final Widget child;
//   const InheritedThemeManager({super.key, required this.child});

//   @override
//   State<InheritedThemeManager> createState() => _InheritedThemeManagerState();
// }

// class _InheritedThemeManagerState extends State<InheritedThemeManager> {
//   late final ThemeProvider themeProvider;
//   bool isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     themeProvider = ThemeProvider();
//     themeProvider.loadSettings().then((_) {
//       setState(() {
//         isInitialized = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!isInitialized) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     return MyChangeNotifierProvider<ThemeProvider>(
//       notifier: themeProvider,
//       child: widget.child,
//     );
//   }
// }
