import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChatHistoryService {
  static const String _storageKey = 'chat_history';

  Future<void> saveHistory(List<Map<String, String>> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(messages);
    await prefs.setString(_storageKey, encodedData);
  }

  Future<List<Map<String, String>>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString(_storageKey);
    if (encodedData == null || encodedData.isEmpty) {
      return [];
    }
    final List<dynamic> decodedData = jsonDecode(encodedData);
    return decodedData.map((item) => Map<String, String>.from(item)).toList();
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}
