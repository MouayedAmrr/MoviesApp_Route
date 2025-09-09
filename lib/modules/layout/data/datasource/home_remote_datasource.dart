import '../../../../models/movie_home_data_model.dart';

abstract class HomeRemoteDataSource {
  Future<MovieHomeData> listMovies(
      {String? genre}
      );
}