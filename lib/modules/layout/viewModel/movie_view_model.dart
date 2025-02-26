import 'package:flutter/foundation.dart';
import 'package:route_movies_app/models/movie_model.dart';

class MovieViewModel extends ChangeNotifier{

  MovieHomeData? _selectedMovie;
  final List<MovieHomeData> _movies = [
    MovieHomeData(id: 1, title: "Movie 1", image: "assets/images/moviephoto.png", rating: 7.7),
    MovieHomeData(id: 2, title: "Movie 2", image: "assets/images/movie2.png", rating: 8.1),
    MovieHomeData(id: 3, title: "Movie 3", image: "assets/images/movie3.png", rating: 7.5),
    MovieHomeData(id: 4, title: "Movie 4", image: "assets/images/movie5.png", rating: 6.9),
  ];

  MovieHomeData? get selectedMovie => _selectedMovie;

  List<MovieHomeData> get movies => _movies;


  void setSelectedMovie (MovieHomeData movie) {
    _selectedMovie = movie;
    notifyListeners();
  }


}