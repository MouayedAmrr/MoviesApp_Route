


import '../../../../models/movie_home_data_model.dart';


abstract class HomeRepo {
  Future<MovieHomeData> listMovies({
    String? genre,
});
}