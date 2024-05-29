import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../src/services/open_ai_service.dart';

class SendPromptPage extends StatefulWidget {
  static const routeName = '/start_page/send_prompt';
  const SendPromptPage({super.key});

  @override
  State<SendPromptPage> createState() => _SendPromptPageState();
}

class _SendPromptPageState extends State<SendPromptPage> {
  final _promptController = TextEditingController();
  final _openAiService = GetIt.instance<OpenAiService>();
  String _response = '';
  bool _isLoading = false;

  Future<void> _sendPrompt() async {
    setState(() {
      _isLoading = true;
      _response = '';
    });

    final result = await _openAiService.sendPrompt(_promptController.text);

    setState(() {
      _isLoading = false;
      _response =
          result?['choices']?[0]?['message']?['content'] ?? 'No response';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Prompt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _promptController,
              decoration: const InputDecoration(
                labelText: 'Prompt',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _sendPrompt,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Send'),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Response:'),
            const SizedBox(height: 10),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Text(
                    _response,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
          ],
        ),
      ),
    );
  }
}
