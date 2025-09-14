import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_movies_app/modules/search/viewmodel/search_states.dart';
import '../../layout/domain/entity/movie_entity.dart';
import '../../layout/domain/usecase/search_movie_usecase.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  SearchCubit(this._searchMoviesUseCase) : super(SearchInitial());

  Future<void> search(String query) async {
    if (query.isEmpty) return;

    emit(SearchLoading());
    try {
      final List<Movies> result = await _searchMoviesUseCase(query);
      emit(SearchSuccess(result));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
