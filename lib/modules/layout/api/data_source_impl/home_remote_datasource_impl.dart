
import 'package:injectable/injectable.dart';

import '../../../../models/movie_home_data_model.dart';
import '../../data/datasource/home_remote_datasource.dart';
import '../client/home_api_client.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {

  final HomeApiClient _homeApiClient;

  HomeRemoteDataSourceImpl(this._homeApiClient);

  @override
  Future<MovieHomeData> listMovies({String? genre}) async{
    return await _homeApiClient.listMovies(genre);
  }
}