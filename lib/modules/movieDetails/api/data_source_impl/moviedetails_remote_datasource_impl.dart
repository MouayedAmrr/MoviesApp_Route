import 'package:injectable/injectable.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/movie_details_model.dart';

import '../../data/data_sources/movie_detalis_remote_datasource.dart';
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
}

