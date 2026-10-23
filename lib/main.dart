import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

const students = [
  Student(name: 'Maribel Corpuz', course: 'BSIT', yearLevel: 3, email: 'maribel.corpuz@csucc.edu.ph'),
  Student(name: 'Jay Aguelo', course: 'BSCS', yearLevel: 2, email: 'jay.aguelo@csucc.edu.ph'),
  Student(name: 'Jonard Osa', course: 'BSIS', yearLevel: 4, email: 'jonard.osa@csucc.edu.ph'),
  Student(name: 'Alex Camacho', course: 'BSCE', yearLevel: 1, email: 'alex.camacho@csucc.edu.ph'),
  Student(name: 'Khen Lumindas', course: 'BSDS', yearLevel: 2, email: 'khen.lumindas@csucc.edu.ph'),
  Student(name: 'Renzel Dela Cruz', course: 'BSIT', yearLevel: 3, email: 'renzel.dela.cruz@csucc.edu.ph'),
];

// Main app
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DirectoryScreen(),
    );
  }
}

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
        backgroundColor: const Color(0xFFFFC0CB),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SectionHeader(title: 'Students'),
          ...students.map((s) => StudentCard(student: s)),
        ],
      ),
    );
  }
}

// Header
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFC0CB),
            ),
          ),
          const Divider(color: Color.fromARGB(255, 235, 174, 184)),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color.fromARGB(255, 240, 178, 189)),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFFFC0CB),
              child: Text(
                student.name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(student.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(student.course),
                  const SizedBox(height: 4),
                  InfoRow(icon: Icons.school, text: 'Year ${student.yearLevel}'),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}