

import 'package:route_movies_app/modules/moviedetails/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;

  MovieDetailsSuccessState(this.movieDetails);
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String message;

  MovieDetailsErrorState(this.message);
}
