import 'package:injectable/injectable.dart';
import 'package:route_movies_app/modules/moviedetails/data/mapper/movie_detailes_mapper.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/movie_details_repo.dart';
import '../data_sources/movie_detalis_remote_datasource.dart';

@LazySingleton(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsRemoteDataSource _remoteDataSource;

  MovieDetailsRepoImpl(this._remoteDataSource);

  @override
  Future<MovieDetailsEntity> getMovieDetails({
    required String movieId,
    bool withImages = true,
    bool withCast = true,
  }) async {
    final model = await _remoteDataSource.getMovieDetails(
      movieId,
      withImages,
      withCast,
    );

    return model.toEntity();
  }

  @override
  Future<List<MovieDetailsEntity>>getRelatedMovies( String movieId) async {
    final model = await _remoteDataSource.getRelatedMovies(movieId);
    return model.map((e) => e.toEntity()).toList();
  }
}
