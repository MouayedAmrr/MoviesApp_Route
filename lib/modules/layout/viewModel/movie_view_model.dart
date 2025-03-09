import 'package:flutter/foundation.dart';
import 'package:route_movies_app/core/Network/api_Network.dart';
import 'package:route_movies_app/models/movie_HomeData_model.dart';

import '../../../models/movie_Data.dart';

class MovieViewModel extends ChangeNotifier {
  Movie? _selectedMovie;
  List<Movie> _movieHomeDataList = [];

  Movie? get selectedMovie => _selectedMovie;
  List<Movie> get movieHomeDataList => _movieHomeDataList;

  void onFilmClicked(Movie selectedMovie) {
    _selectedMovie = selectedMovie;
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
}
