import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/movie_Data.dart';
import '../constants/api_constants/constants.dart';
import '../constants/api_constants/end_points.dart';

abstract class ApiNetwork {
  static Future<List<Movie>> getHomeFilmData() async {
    try {
      var uri = Uri.parse("${ApiConstants.baseUrl}${EndPoints.listMovies}");

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Check if "movies" exists in response
        if (data["data"] != null && data["data"]["movies"] != null) {
          return (data["data"]["movies"] as List)
              .map((movieJson) => Movie.fromJson(movieJson))
              .toList();
        } else {
          throw Exception("Movies list not found in API response");
        }
      } else {
        throw Exception("Failed to load movies: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching movies: $error");
    }
  }
}


