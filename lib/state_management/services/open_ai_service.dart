import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class OpenAiService {
  final _secureStorage = GetIt.instance<FlutterSecureStorage>();
  final String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  Future<String?> _getApiKey() async {
    return await _secureStorage.read(key: 'openai_api_key');
  }

  Future<Map<String, dynamic>?> sendPrompt(String prompt) async {
    final apiKey = await _getApiKey();
    if (apiKey == null) return null;

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 100,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
