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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter OpenAI API Key',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showTooltip,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _apiKeyController,
              decoration: const InputDecoration(
                labelText: 'Enter API Key here',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await _saveApiKey();
                  showSnackBar();
                },
                child: Text(
                  'Save API Key',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: testAPIKey,
              child: Text(
                'Test API Key',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
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
