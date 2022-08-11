import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchArticles() async {
  final response = await http.get(
      Uri.parse('https://5fb39fd2b6601200168f7a41.mockapi.io/api/articles'));
  if (response.statusCode == 200) {
    final List articleList = jsonDecode(response.body) as List<dynamic>;
    return articleList;
  } else {
    throw Exception('Failed to load articles');
  }
}
