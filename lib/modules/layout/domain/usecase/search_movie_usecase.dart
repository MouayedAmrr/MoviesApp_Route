import 'package:injectable/injectable.dart';
import '../entity/movie_entity.dart';
import '../repo/home_repo.dart';

@lazySingleton
class SearchMoviesUseCase {
  final HomeRepo _homeRepo;

  SearchMoviesUseCase(this._homeRepo);

  Future<List<Movies>> call(String query) async {
    return await _homeRepo.searchMovies(query);
  }
}
