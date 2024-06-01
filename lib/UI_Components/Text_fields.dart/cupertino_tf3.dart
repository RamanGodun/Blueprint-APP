import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextField3 extends StatelessWidget {
  const CupertinoTextField3({
    super.key,
    required TextEditingController apiKeyController,
    required this.colorScheme,
    required this.textTheme,
  }) : _apiKeyController = apiKeyController;

  final TextEditingController _apiKeyController;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _apiKeyController,
      placeholder: 'Enter API Key here',
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.primary, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      style: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
