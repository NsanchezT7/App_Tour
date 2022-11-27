
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mis_libros/models/result.dart';

class SitieApi{
  Future<Result> getSitie(String parameter) async {
    final response = await http.get(Uri.parse(
        'https://api.geoapify.com/v1/geocode/search?name=$parameter&format=json&apiKey=152abf8599f1441190589034c9f7d6b3'));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load sities');
    }
  }
}