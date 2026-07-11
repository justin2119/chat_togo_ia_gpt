import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TogoLmService {
  final String baseUrl = dotenv.env['TOGOLM_API_URL'] ?? '';

  Future<String> query(String prompt) async {
    final String apiKey = dotenv.env['TOGOLM_API_KEY'] ?? '';

    if (baseUrl.isEmpty) {
      developer.log('TogoLmService: TOGOLM_API_URL is not set in .env');
      return "Désolé, l'URL du service TogoLM n'est pas configurée...";
    }

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-API-Key': apiKey,
        },
        body: jsonEncode({
          'question': prompt,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['answer'] ?? 'TogoLM n\'a pas renvoyé de réponse.';
      } else {
        developer.log('TogoLmService Error: ${response.statusCode} - ${response.body}');
        if (response.statusCode == 401 || response.statusCode == 403) {
          return "Désolé, il semble y avoir un souci avec ma clé d'accès à TogoLM...";
        }
        if (response.statusCode == 500) {
          return "Le serveur TogoLM est un peu fatigué là, réessaie dans un instant bro...";
        }
        return "Désolé, TogoLM rencontre une petite difficulté technique (Code ${response.statusCode})...";
      }
    } on TimeoutException catch (e) {
      developer.log('TogoLmService Timeout Error: $e');
      return "Désolé bro, le serveur TogoLM met trop de temps à répondre. Réessaie dans un instant...";
    } on http.ClientException catch (e) {
      developer.log('TogoLmService Network Error: $e');
      return "Désolé, j'arrive pas à joindre TogoLM pour l'instant. Vérifie ta connexion...";
    } catch (e) {
      developer.log('TogoLmService Unexpected Error: $e');
      return "Désolé, une erreur inattendue est survenue en essayant de contacter TogoLM...";
    }
  }
}
