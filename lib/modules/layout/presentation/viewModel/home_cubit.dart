import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/movie_entity.dart';
import '../../domain/usecase/get_movies_list_usecase.dart';
import 'home_states.dart';


@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMoviesListUseCase _getMoviesListUseCase;

  HomeCubit(this._getMoviesListUseCase) : super(HomeState());

  Future<void> getTopMovies() async {
    emit(state.copyWith(isTopLoading: true));
    try {
      final List<Movies> result = await _getMoviesListUseCase.call();
      emit(state.copyWith(
        isTopLoading: false,
        topMovies: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        isTopLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> getMoviesByGenre(String genre) async {
    emit(state.copyWith(isGenreLoading: true, genreName: genre));
    try {
      final List<Movies> result =
      await _getMoviesListUseCase.call(genre: genre);
      emit(state.copyWith(
        isGenreLoading: false,
        genreMovies: result,
        genreName: genre,
      ));
    } catch (e) {
      emit(state.copyWith(
        isGenreLoading: false,
        error: e.toString(),
      ));
    }
  }
}
