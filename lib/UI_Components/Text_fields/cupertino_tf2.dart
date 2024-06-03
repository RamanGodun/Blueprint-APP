import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextField2 extends StatelessWidget {
  const CupertinoTextField2({
    super.key,
    required this.textController,
    required this.isValid,
    required this.validateInput,
  });

  final TextEditingController textController;
  final ValueNotifier<bool> isValid;
  final VoidCallback validateInput;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoTextField(
        controller: textController,
        placeholder: 'Enter text',
        decoration: BoxDecoration(
          border: Border.all(
            color: isValid.value
                ? CupertinoColors.inactiveGray
                : CupertinoColors.destructiveRed,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        onChanged: (text) => validateInput(),
      ),
    );
  }
}
