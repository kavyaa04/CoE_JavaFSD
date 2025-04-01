import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> fetchQuote() async {
    try {
      final response = await http.get(Uri.parse('https://zenquotes.io/api/random'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data[0]['q']; // Extracting the quote correctly
      } else {
        return "Error: Failed to fetch quote.";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  static Future<List<String>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?category=general&apiKey=4cccf6be49d1449abfe19cc5cd33727b'));

      if (response.statusCode == 200) {
        List articles = jsonDecode(response.body)['articles'];
        return articles.map((article) => article['title'] as String).toList();
      } else {
        return ["Error: Failed to load news"];
      }
    } catch (e) {
      return ["Error: $e"];
    }
  }
}
