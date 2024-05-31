import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../../state_management/services/open_ai_service.dart';

class ApiKeyInputPage extends StatefulWidget {
  static const routeName = '/start_page/settings/enter_api_key';
  const ApiKeyInputPage({super.key});

  @override
  State<ApiKeyInputPage> createState() => _ApiKeyInputPageState();
}

class _ApiKeyInputPageState extends State<ApiKeyInputPage> {
  final _apiKeyController = TextEditingController();
  final _secureStorage = GetIt.instance<FlutterSecureStorage>();

  @override
  void initState() {
    super.initState();
    _loadApiKey();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Enter OpenAI API Key',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _showTooltip,
          child: Icon(
            CupertinoIcons.info,
            color: colorScheme.primary,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(
                  controller: _apiKeyController,
                  placeholder: 'Enter API Key here',
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.primary, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    onPressed: () async {
                      await _saveApiKey();
                      showSnackBar();
                    },
                    child: Text(
                      'Save API Key',
                      style: textTheme.bodyLarge?.copyWith(
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                CupertinoButton(
                  color: colorScheme.primary,
                  onPressed: testAPIKey,
                  child: Text(
                    'Test API Key',
                    style: textTheme.bodyLarge?.copyWith(
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void testAPIKey() async {
    final openAiService = OpenAiService();
    final response = await openAiService.sendPrompt("Hello, how are you?");
    // ignore: avoid_print
    print(response);
  }

  Future<void> _loadApiKey() async {
    final apiKey = await _secureStorage.read(key: 'openai_api_key');
    if (apiKey != null) {
      _apiKeyController.text = apiKey;
    }
  }

  Future<void> _saveApiKey() async {
    await _secureStorage.write(
        key: 'openai_api_key', value: _apiKeyController.text);
  }

  void _showTooltip() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('How to get your OpenAI API Key'),
          content: const Text(
              'To get your OpenAI API Key:\n\n1. Go to the OpenAI website.\n2. Log in to your account.\n3. Navigate to the API section.\n4. Generate a new API key or copy an existing one.\n\nPaste the key here to use the OpenAI API.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('API Key saved successfully!'),
    ));
  }
}
