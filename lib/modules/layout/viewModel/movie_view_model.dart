import 'package:flutter/foundation.dart';
import 'package:route_movies_app/core/Network/api_Network.dart';
import 'package:route_movies_app/models/movie_HomeData_model.dart';

import '../../../core/constants/app_assets.dart';

class MovieViewModel extends ChangeNotifier {
  MovieHomeData? _selectedMovie;
  List<MovieHomeData> _movieHomeDataList = [];

  MovieHomeData? get selectedMovie => _selectedMovie;
  List<MovieHomeData> get movieHomeDataList => _movieHomeDataList;

  List<MovieHomeData> movies = [
    MovieHomeData(id: "1", image: AppAssets.movie1, rating: "8.5"),
    MovieHomeData(id: "2", image: AppAssets.movie2, rating: "7.9"),
    MovieHomeData(id: "3", image: AppAssets.movie3, rating: "9.0"),
    MovieHomeData(id: "4", image: AppAssets.movie4, rating: "8.2"),
    MovieHomeData(id: "5", image: AppAssets.movie5, rating: "7.5"),
  ];





  void setSelectedMovie(MovieHomeData movie) {
    _selectedMovie = movie;
    notifyListeners();
  }

  Future<void> getHomeFilmData() async {
    try {

      notifyListeners();
      _movieHomeDataList = await ApiNetwork.getHomeFilmData();

    } catch (error) {
      print("Error fetching movies: $error");
    } 
  }
}
