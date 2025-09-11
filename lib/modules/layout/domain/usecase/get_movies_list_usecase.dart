import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repo/home_repo.dart';

@lazySingleton
class GetMoviesListUseCase {
  final HomeRepo _homeRepo;

  GetMoviesListUseCase(this._homeRepo);

  Future<List<Movies>> call({String? genre}) async {
    return await _homeRepo.listMovies(genre: genre);
  }
}
