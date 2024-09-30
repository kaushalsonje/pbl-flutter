import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  static const routeName = '/timetable';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: Timetable(),
    );
  }
}

class Timetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TimetableDay(day: 'Monday', subjects: ['DSA', 'M3', 'PPL', 'SE', 'MP']),
        TimetableDay(
            day: 'Tuesday', subjects: ['MP', 'SE', 'PPL', 'DSA', 'PBL']),
        TimetableDay(
            day: 'Wednesday', subjects: ['DSAL', 'DSA', 'PPL', 'MP', 'SE']),
        TimetableDay(
            day: 'Thursday', subjects: ['PBL', 'DSA', 'M3', 'SE', 'MP']),
        TimetableDay(
            day: 'Friday', subjects: ['M3 Tut', 'PPL', 'M3', 'Break', 'Break']),
        TimetableDay(
            day: 'Saturday', subjects: ['DSAL', 'DSA', 'M3', 'COC', 'Break']),
      ],
    );
  }
}

class TimetableDay extends StatelessWidget {
  final String day;
  final List<String> subjects;

  TimetableDay({required this.day, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      color: Colors.grey[300],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              day,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var subject in subjects) SubjectTile(subject: subject),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectTile extends StatelessWidget {
  final String subject;

  SubjectTile({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 80.0,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          subject,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }
}
