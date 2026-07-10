import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TogoLmService {
  final String baseUrl = 'https://api.togolm.kofcorporation.com/v1/query';

  Future<String> query(String prompt) async {
    try {
      final String apiKey = dotenv.env['TOGOLM_API_KEY'] ?? '';
      
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-API-Key': apiKey,
        },
        body: jsonEncode({
          'query': prompt,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['answer'] ?? 'No response content';
      } else {
        return 'Error: ${response.statusCode} - ${response.body}';
      }
    } catch (e) {
      return 'Exception: $e';
    }
  }
}
