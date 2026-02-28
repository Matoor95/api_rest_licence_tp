import 'dart:convert';

import 'package:api_rest/models/post.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/posts'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Echech du chargement des posts');
      }
    } catch (e) {
      print('Erreur API $e');
      throw e;
    }
  }
}
