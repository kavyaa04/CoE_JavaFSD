


import 'package:flutter/material.dart';
import 'diet_screen.dart';
import 'exercise_screen.dart';
import 'journal_screen.dart';
import 'quote_screen.dart';
import 'timer_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3D9C1), Color(0xFFD9B08C)], // Peach & Warm Beige
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Text(
              "Welcome to Study Motivation App!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A4236), // Dark Mocha
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Feature Buttons
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25),
                children: [
                  _buildFeatureButton(context, "Diet", Icons.fastfood, DietScreen()),
                  _buildFeatureButton(context, "Exercise", Icons.fitness_center, ExerciseScreen()),
                  _buildFeatureButton(context, "Journal", Icons.book, JournalScreen()),
                  _buildFeatureButton(context, "Quotes", Icons.format_quote, QuoteScreen()),
                  _buildFeatureButton(context, "Timer", Icons.timer, TimerScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context, String title, IconData icon, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF7E5D1), // Soft Cream
          foregroundColor: Color(0xFF5A4236), // Dark Mocha
          minimumSize: const Size(double.infinity, 55),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Color(0xFF8D6E63)), // Soft Taupe
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}






