import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/movie_entity.dart';
import '../../domain/usecase/get_movies_list_usecase.dart';
import 'home_states.dart';


@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMoviesListUseCase _getMoviesListUseCase;


  Timer? _genreTimer;

  final List<String> _genres = [
    "Drama",
    "Action",
    "Romance",
    "Comedy",
    "Horror",
    "Documentary",
    "Thriller",
    "Family",
    "Musical",
    "Music",
    "Fantasy",
    "Sci-Fi",
    "Crime",
  ];

  int _currentGenreIndex = 0;


  HomeCubit(this._getMoviesListUseCase) : super(HomeState());

  Future<void> getTopMovies() async {
    emit(state.copyWith(isTopLoading: true));
    try {
      final List<Movies> result = await _getMoviesListUseCase.call();
      print("Movies result (Top): $result");
      print("Movies count (Top): "+result.length.toString());
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
      print("Movies result (Genre): $result");
      print("Movies count (Genre): "+result.length.toString());
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
  void startRotatingGenres() {
    _genreTimer?.cancel();

    getMoviesByGenre(_genres[_currentGenreIndex]);

    _genreTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      _currentGenreIndex = (_currentGenreIndex + 1) % _genres.length;
      final nextGenre = _genres[_currentGenreIndex];
      getMoviesByGenre(nextGenre);
    });
  }

  void stopGenrePolling() {
    _genreTimer?.cancel();
    _genreTimer = null;
  }

  @override
  Future<void> close() {
    stopGenrePolling();
    return super.close();
  }
}
