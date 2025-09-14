import 'package:injectable/injectable.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../repositories/movie_details_repo.dart';

@injectable
class GetMovieDetailsUseCase {
  final MovieDetailsRepo _repository;

  GetMovieDetailsUseCase(this._repository);

  Future<MovieDetailsEntity> call({
    required String movieId,
    bool withImages = true,
    bool withCast = true,
  }) async {
    return await _repository.getMovieDetails(
      movieId: movieId,
      withImages: withImages,
      withCast: withCast,
    );
  }

  Future<List<MovieDetailsEntity>> getRelatedMovies(String movieId) async {
    return await _repository.getRelatedMovies(movieId);
  }
}
