import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String quote = "Loading...";

  Future<void> fetchQuote() async {
    final response = await http.get(Uri.parse('https://api.example.com/quotes?api_key=xxx'));
    if (response.statusCode == 200) {
      setState(() {
        quote = json.decode(response.body)['quote'];
      });
    } else {
      setState(() {
        quote = "The harder you work, the smarter you get.";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Quote")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(quote, textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchQuote,
              child: Text("Refresh Quote"),
            ),
          ],
        ),
      ),
    );
  }
}
