import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants/end_points.dart';

import '../../data/models/movie_details_response.dart';
import '../../data/models/related_movies_response_model.dart';

part 'movie_details_api_client.g.dart';

@injectable
@RestApi()
abstract class MovieDetailsApiClient {
  @factoryMethod
  factory MovieDetailsApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) =
      _MovieDetailsApiClient;

  @GET(EndPoints.moviesDetails)
  Future<MovieDetailsResponse> getMovieDetails(
    @Query('movie_id') String movieId,
    @Query('with_images') bool? withImages,
    @Query('with_cast') bool? withCast,
  );

  @GET(EndPoints.relatedMovies)
  Future<RelatedMoviesResponse> getRelatedMovies(
    @Query('movie_id') String movieId,
  );
}
