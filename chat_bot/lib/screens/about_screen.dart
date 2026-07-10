import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos / About'),
        backgroundColor: const Color.fromRGBO(0, 112, 82, 1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromRGBO(0, 112, 82, 1),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Développeur / Developer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 112, 82, 1)),
            ),
            const Text(
              'Justin Bina, Flutter/Dart Developer, expert in African digital sovereignty and TogoLM project.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Application',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 112, 82, 1)),
            ),
            const Text(
              'A Flutter-based chat assistant powered by TogoLM, the first Togolese open-source AI infra.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Un assistant de chat basé sur Flutter et propulsé par TogoLM, la première infrastructure d\'IA open-source togolaise.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 40),
            const Divider(),
            const Center(
              child: Text(
                '© 2026 TogoLM Project',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
