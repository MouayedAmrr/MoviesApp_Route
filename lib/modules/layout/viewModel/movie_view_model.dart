import 'package:flutter/foundation.dart';
import 'package:route_movies_app/core/Network/api_Network.dart';

import '../../../models/movie_Data.dart';

class MovieViewModel extends ChangeNotifier {
  Movie? _selectedMovie;
  List<Movie> _movieHomeDataList = [];

  Movie? get selectedMovie => _selectedMovie;
  List<Movie> get movieHomeDataList => _movieHomeDataList;

  void onFilmClicked(Movie selectedMovie) {
    _selectedMovie = selectedMovie;
    fetchMovieDetails(selectedMovie.id);
    notifyListeners();
  }

  Future<void> getHomeFilmData() async {
    try {
      _movieHomeDataList = await ApiNetwork.getHomeFilmData();
      notifyListeners();
    } catch (error) {
      print("Error fetching movies: $error");
    }
  }
  Future<void> fetchMovieDetails(String movieId) async {
    try {
      _selectedMovie = await ApiNetwork.getMovieDetails(movieId);
      notifyListeners();
    } catch (error) {
      print("Error fetching movie details: $error");
    }
  }
}
