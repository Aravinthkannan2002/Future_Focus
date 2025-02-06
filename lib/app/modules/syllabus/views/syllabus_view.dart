import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/syllabus_controller.dart';

class SyllabusView extends GetView<SyllabusController> {
  SyllabusView({super.key});

  // Sample syllabus data structure
  final Map<String, Map<String, List<String>>> syllabus = {
    '10th': {
      'Math': [
        'Find the value of x: 2x + 3 = 7',
        'What is the area of a circle with radius 7 cm?',
        'Solve: x^2 - 4x + 4 = 0'
      ],
      'Science': [
        'Define Newton\'s First Law of Motion.',
        'What is the chemical formula of water?',
        'Explain the process of photosynthesis.'
      ],
    },
    '11th': {
      'Physics': [
        'State the laws of motion.',
        'Define and explain gravitational force.',
        'What is the difference between scalar and vector quantities?'
      ],
      'Chemistry': [
        'What is the periodic table?',
        'Explain the concept of chemical bonding.',
        'What is the molecular formula of ammonia?'
      ],
    },
    '12th': {
      'Math': [
        'Solve the integral ∫x^2 dx.',
        'What is the derivative of sin(x)?',
        'Find the roots of the quadratic equation: x^2 + 5x + 6 = 0'
      ],
      'Biology': [
        'Explain the structure of DNA.',
        'What is the function of the mitochondria?',
        'Define and explain osmosis.'
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Syllabus View'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: syllabus.keys.length,
        itemBuilder: (context, index) {
          String grade = syllabus.keys.elementAt(index);
          Map<String, List<String>> subjects = syllabus[grade]!;

          return ExpansionTile(
            title: Text(grade,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            children: subjects.entries.map((subjectEntry) {
              String subject = subjectEntry.key;
              List<String> questions = subjectEntry.value;

              return ExpansionTile(
                title: Text(subject, style: TextStyle(fontSize: 20)),
                children: questions.map((question) {
                  return ListTile(
                    title: Text(question),
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
