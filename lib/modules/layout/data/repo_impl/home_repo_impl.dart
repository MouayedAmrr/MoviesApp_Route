import 'package:injectable/injectable.dart';
import 'package:route_movies_app/modules/layout/data/mapper/movie_model_mapper.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../datasource/home_remote_datasource.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);

  @override
  Future<List<Movies>> listMovies({String? genre}) async {
    final response = await _homeRemoteDataSource.listMovies(genre: genre);

    return response.data?.movies?.map((m) => m.toEntity()).toList() ?? [];
  }

  @override
  Future<List<Movies>> searchMovies(String query) async {
    final response = await _homeRemoteDataSource.searchMovies(query);
    return response.data?.movies?.map((m) => m.toEntity()).toList() ?? [];
  }
}
