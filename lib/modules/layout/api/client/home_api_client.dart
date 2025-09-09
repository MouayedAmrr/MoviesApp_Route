import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants/end_points.dart';
import '../../../../models/movie_home_data_model.dart';

part 'home_api_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClient {

  @factoryMethod
  factory HomeApiClient(Dio dio, {@Named('baseurl') String? baseUrl }) = _HomeApiClient;

  @GET(EndPoints.listMovies)
  Future<MovieHomeData> listMovies(@Query('genre') String? genre);

}