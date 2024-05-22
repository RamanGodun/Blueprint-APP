import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state management/state 4 interviewer app/inherited_state_manager.dart';
import 'app.localization.dart';

class AppStateManagement extends StatelessWidget {
  const AppStateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: InheritedWidgetManager(
        child: LocalizationOfThisApp(),
      ),
    );
  }
}
