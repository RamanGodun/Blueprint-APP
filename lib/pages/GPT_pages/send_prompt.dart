import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../State_management/Services/open_ai_service.dart';

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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Send Prompt'),
      ),
      child: Material(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(
                  controller: _promptController,
                  placeholder: 'Prompt',
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(
                      color: CupertinoColors.lightBackgroundGray,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    onPressed: _sendPrompt,
                    child: _isLoading
                        ? const CupertinoActivityIndicator()
                        : const Text('Send'),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Response:',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          _response,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
