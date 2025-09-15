


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_movies_app/modules/moviedetails/presentation/viewmodel/related_movie_states.dart';

import '../../domain/use_cases/movies_details_usecase.dart';

@injectable
class RelatedMoviesCubit extends Cubit<RelatedMoviesState> {
  final GetMovieDetailsUseCase _useCase;

  RelatedMoviesCubit(this._useCase) : super(RelatedMoviesInitialState());

  Future<void> getRelatedMovies(String movieId) async {
    emit(RelatedMoviesLoadingState());
    try {
      final result = await _useCase.getRelatedMovies(movieId);
      emit(RelatedMoviesSuccessState(result));
    } catch (e) {
      emit(RelatedMoviesErrorState(e.toString()));
    }
  }
}
