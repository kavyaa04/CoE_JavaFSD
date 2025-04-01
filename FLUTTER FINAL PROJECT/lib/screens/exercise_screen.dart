import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  List exercises = [];

  Future<void> fetchExercises() async {
    final response = await http.get(Uri.parse('https://api.example.com/exercises?api_key=xxx'));
    if (response.statusCode == 200) {
      setState(() {
        exercises = json.decode(response.body);
      });
    } else {
      setState(() {
        exercises = [
          {"name": "Push-ups", "duration": "10 min"},
          {"name": "Squats", "duration": "15 min"},
          {"name": "Plank", "duration": "5 min"},
        ];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercises")),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(exercises[index]['name']),
            subtitle: Text("Duration: ${exercises[index]['duration']}"),
          );
        },
      ),
    );
  }
}
