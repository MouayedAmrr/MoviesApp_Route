import '../../domain/entities/movie_details_entity.dart';
import '../models/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails(
    String movieId,
    bool? withImages,
    bool? withCast,
  );

  Future<List<MovieDetailsModel>> getRelatedMovies(String movieId);
}
