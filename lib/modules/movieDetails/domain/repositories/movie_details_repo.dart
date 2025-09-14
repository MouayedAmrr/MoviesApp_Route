import '../../domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepo {
  Future<MovieDetailsEntity> getMovieDetails({
    required String movieId,
    bool withImages = true,
    bool withCast = true,
  });

  Future<List<MovieDetailsEntity>> getRelatedMovies(String movieId);
}
