
import 'package:injectable/injectable.dart';
import 'package:route_movies_app/models/movie_home_data_model.dart';

import '../../domain/repo/home_repo.dart';
import '../datasource/home_remote_datasource.dart';

@LazySingleton(as:HomeRepo )
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);
  @override
  Future<MovieHomeData> listMovies({String? genre}) {
    return _homeRemoteDataSource.listMovies(genre: genre);
  }

}