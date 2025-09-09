

import 'package:injectable/injectable.dart';

import '../../../../models/movie_home_data_model.dart';
import '../repo/home_repo.dart';

@lazySingleton
class GetMoviesListUseCase{
  final HomeRepo _homeRepo;

  GetMoviesListUseCase(this._homeRepo);


  Future<MovieHomeData> call({String? genre})async{
    return await _homeRepo.listMovies(genre: genre);
  }
}