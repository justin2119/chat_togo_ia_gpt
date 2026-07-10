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
                radius: 70,
                backgroundColor: Color.fromRGBO(0, 112, 82, 1),
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Développeur ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 112, 82, 1)),
            ),
            SizedBox(height: 8),
            Text(
              'Justin Bina Développeur web et Mobile',
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Text(
              'Application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 112, 82, 1)),
            ),
            SizedBox(height: 8),
            Text(
              'Un assistant de conversation propulsé par TogoLM, la première infrastructure d\'IA open-source togolaise.',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
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
