import '../entity/movie_entity.dart';

abstract class HomeRepo {
  Future<List<Movies>> listMovies({String? genre});

  Future<List<Movies>> searchMovies(String query);
}
