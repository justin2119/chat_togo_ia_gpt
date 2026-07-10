import 'dart:convert';
import 'package:http/http.dart' as http;

class TogoLmService {
  final String baseUrl = 'https://api.togolm.kofcorporation.com/v1/query';
  Future<String> query(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer tgolm_a1dab46e93a59685eb0a348068014169ebf1a3a219533dd8',
        },
        body: jsonEncode({
          'question': prompt,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] ?? data['answer'] ?? 'No response content';
      } else {
        return 'Error: ${response.statusCode} - ${response.body}';
      }
    } catch (e) {
      return 'Exception: $e';
    }
  }
}
