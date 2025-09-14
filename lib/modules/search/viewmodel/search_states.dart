import '../../layout/domain/entity/movie_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Movies> movies;
  SearchSuccess(this.movies);
}

class SearchFailure extends SearchState {
  final String message;
  SearchFailure(this.message);
}
