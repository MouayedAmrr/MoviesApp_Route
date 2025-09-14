
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/movies_details_usecase.dart';
import 'movie_details_states.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _useCase;
  MovieDetailsCubit(this._useCase) : super(MovieDetailsInitialState());


  Future<void> getMovieDetails( String movieId) async {
    emit(MovieDetailsLoadingState());

    try {
      final result = await _useCase.call(movieId: movieId , withImages: true, withCast: true);
      emit(MovieDetailsSuccessState(result));

    }catch(e){
      emit(MovieDetailsErrorState(e.toString()));

    }
  }

}