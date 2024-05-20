import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldPage extends HookWidget {
  static const routeName = '/new_screen';

  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final isValid = useState(true);

    void validateInput() {
      isValid.value = textController.text.isNotEmpty;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter text',
                errorText: isValid.value ? null : 'This field cannot be empty',
              ),
              onChanged: (text) => validateInput(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
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
