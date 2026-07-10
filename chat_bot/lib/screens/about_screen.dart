import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
        backgroundColor: const Color.fromRGBO(0, 112, 82, 1),
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromRGBO(0, 112, 82, 1),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Développeur',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 112, 82, 1)),
            ),
            Text(
              'Justin Bina,Developpeur Web et Mobile,',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Application',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 112, 82, 1)),
            ),
            Text(
              'A Flutter-based chat assistant powered by TogoLM, the first Togolese open-source AI infra.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Un assistant de chat basé sur Flutter et propulsé par TogoLM, la première infrastructure d\'IA open-source togolaise.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 40),
            Divider(),
            Center(
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
