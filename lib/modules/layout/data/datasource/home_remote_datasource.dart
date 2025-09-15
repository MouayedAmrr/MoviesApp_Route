import '../models/movie_data_model.dart';

abstract class HomeRemoteDataSource {
  Future<MovieDataModel> listMovies({String? genre});
  Future<MovieDataModel> searchMovies(String query);
}
