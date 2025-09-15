import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_movies_list_usecase.dart';
import 'explore_states.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final GetMoviesListUseCase getMoviesListUseCase;

  ExploreCubit(this.getMoviesListUseCase) : super(ExploreInitial());

  Future<void> loadMoviesByGenre(String genre) async {
    emit(ExploreLoading());
    try {
      final movies = await getMoviesListUseCase.call(genre: genre);
      emit(ExploreLoaded(movies));
    } catch (e) {
      emit(ExploreError(e.toString()));
    }
  }
}
