import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/movie_HomeData_model.dart';
import '../constants/api_constants/constants.dart';
import '../constants/api_constants/end_points.dart';

abstract class ApiNetwork {
  static Future<List<MovieHomeData>> getHomeFilmData() async {
    try {
      var uri = Uri.https(
        ApiConstants.baseUrl,
        EndPoints.listMovies,
      );

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        List<MovieHomeData> movies = (data['data']['movies'] as List)
            .map((movieJson) => MovieHomeData.fromjson(movieJson))
            .toList();

        return movies;
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (error) {
      throw Exception("Error fetching movies: $error");
    }
  }
}
