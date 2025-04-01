import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DietScreen extends StatefulWidget {
  @override
  _DietScreenState createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  List meals = [];

  Future<void> fetchMeals() async {
    final response = await http.get(Uri.parse('https://api.example.com/meals?api_key=xxx'));
    if (response.statusCode == 200) {
      setState(() {
        meals = json.decode(response.body);
      });
    } else {
      setState(() {
        meals = [
          {"meal": "Oatmeal with Fruits", "calories": "250 kcal"},
          {"meal": "Grilled Chicken Salad", "calories": "350 kcal"},
          {"meal": "Smoothie Bowl", "calories": "200 kcal"},
        ];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diet Plan")),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(meals[index]['meal']),
            subtitle: Text("Calories: ${meals[index]['calories']}"),
          );
        },
      ),
    );
  }
}
