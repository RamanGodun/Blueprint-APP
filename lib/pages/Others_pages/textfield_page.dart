import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldPage extends HookWidget {
  static const routeName = '/start_page/new_screen';

  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final isValid = useState(true);

    void validateInput() {
      isValid.value = textController.text.isNotEmpty;
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'New Screen',
          style: TextStyle(
            color: CupertinoTheme.of(context).primaryColor,
            fontSize: 20,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
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
            if (!isValid.value)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'This field cannot be empty',
                  style: TextStyle(
                    color: CupertinoColors.destructiveRed,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () {
                if (isValid.value) {
                  // Handle the submit action
                } else {
                  validateInput();
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
