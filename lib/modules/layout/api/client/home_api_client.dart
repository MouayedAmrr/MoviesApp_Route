import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:route_movies_app/modules/layout/data/models/movie_data_model.dart';

import '../../../../core/constants/api_constants/end_points.dart';

part 'home_api_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClient {

  @factoryMethod
  factory HomeApiClient(Dio dio, {@Named('baseurl') String? baseUrl }) = _HomeApiClient;

  @GET(EndPoints.listMovies)
  Future<MovieDataModel> listMovies(@Query('genre') String? genre);

}