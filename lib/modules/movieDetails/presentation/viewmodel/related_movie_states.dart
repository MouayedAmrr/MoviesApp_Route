import '../../domain/entities/movie_details_entity.dart';

abstract class RelatedMoviesState {}

class RelatedMoviesInitialState extends RelatedMoviesState {}


class RelatedMoviesLoadingState extends RelatedMoviesState {}

class RelatedMoviesSuccessState extends RelatedMoviesState {
  final List<MovieDetailsEntity> relatedMovies;
  RelatedMoviesSuccessState(this.relatedMovies);
}

class RelatedMoviesErrorState extends RelatedMoviesState {
  final String message;
  RelatedMoviesErrorState(this.message);
}
