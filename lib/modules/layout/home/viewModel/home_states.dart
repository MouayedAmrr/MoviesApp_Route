import 'package:route_movies_app/modules/layout/domain/entity/movie_entity.dart';

class HomeState {
  final bool isTopLoading;
  final bool isGenreLoading;
  final List<Movies> topMovies;
  final List<Movies> genreMovies;
  final String? genreName;
  final String? error;

  HomeState({
    this.isTopLoading = false,
    this.isGenreLoading = false,
    this.topMovies = const [],
    this.genreMovies = const [],
    this.genreName,
    this.error,
  });

  HomeState copyWith({
    bool? isTopLoading,
    bool? isGenreLoading,
    List<Movies>? topMovies,
    List<Movies>? genreMovies,
    String? genreName,
    String? error,
  }) {
    return HomeState(
      isTopLoading: isTopLoading ?? this.isTopLoading,
      isGenreLoading: isGenreLoading ?? this.isGenreLoading,
      topMovies: topMovies ?? this.topMovies,
      genreMovies: genreMovies ?? this.genreMovies,
      genreName: genreName ?? this.genreName,
      error: error,
    );
  }
}
