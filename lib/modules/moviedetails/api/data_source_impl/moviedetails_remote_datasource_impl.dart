

import 'package:injectable/injectable.dart';

import '../../data/data_sources/movie_detalis_remote_datasource.dart';
import '../../data/models/movie_details_model.dart';
import '../client/movie_details_api_client.dart';

@LazySingleton(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final MovieDetailsApiClient movieDetailsApiClient;

  MovieDetailsRemoteDataSourceImpl(this.movieDetailsApiClient);

  @override
  Future<MovieDetailsModel> getMovieDetails(
      String movieId,
      bool? withImages,
      bool? withCast,
      ) async {
    final response = await movieDetailsApiClient.getMovieDetails(
      movieId,
      withImages,
      withCast,
    );
    return response.data.movie;
  }

  @override
  Future<List<MovieDetailsModel>> getRelatedMovies(String movieId) async {
    final response = await movieDetailsApiClient.getRelatedMovies(movieId);
    return response.data.movies;
  }

}

