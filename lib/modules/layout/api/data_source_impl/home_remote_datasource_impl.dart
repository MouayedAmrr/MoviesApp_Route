
import 'package:injectable/injectable.dart';

import '../../data/datasource/home_remote_datasource.dart';
import '../../data/models/movie_data_model.dart';
import '../client/home_api_client.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {

  final HomeApiClient _homeApiClient;

  HomeRemoteDataSourceImpl(this._homeApiClient);

  @override
  Future<MovieDataModel> listMovies({String? genre}) async{
    return await _homeApiClient.listMovies(genre);
  }
}