

import '../../domain/entity/movie_entity.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeLoadingState extends HomeStates{}

class HomeSuccessState extends HomeStates{
    final List<Movies> movies;
  HomeSuccessState(this.movies);
}

class HomeErrorState extends HomeStates{
  final String errorMsg;
  HomeErrorState(this.errorMsg);
}
