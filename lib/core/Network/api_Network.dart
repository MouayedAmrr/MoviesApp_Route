import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/movie_Data.dart';
import '../constants/api_constants/constants.dart';
import '../constants/api_constants/end_points.dart';

abstract class ApiNetwork {
  static Future<List<Movie>> getHomeFilmData() async {
    try {
      var uri = Uri.parse("${ApiConstants.baseurl}${EndPoints.listMovies}");

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

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

  //
  // static Future<List<Movie>> geMovieDetails() async {
  //   try{
  //
  //   }catch(error){}
  // }

// In ApiNetwork class
  static Future<Movie> getMovieDetails(String movieId) async {
    try {
      var uri = Uri.parse("${ApiConstants.baseurl}${EndPoints.listMovies}/$movieId");

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["data"] != null) {
          return Movie.fromJson(data["data"]);
        } else {
          throw Exception("Movie details not found in API response");
        }
      } else {
        throw Exception("Failed to load movie details: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching movie details: $error");
    }
  }

}


