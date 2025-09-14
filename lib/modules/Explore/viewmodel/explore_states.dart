import '../../layout/domain/entity/movie_entity.dart';

abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<Movies> movies;

  ExploreLoaded(this.movies);
}

class ExploreError extends ExploreState {
  final String message;

  ExploreError(this.message);
}
