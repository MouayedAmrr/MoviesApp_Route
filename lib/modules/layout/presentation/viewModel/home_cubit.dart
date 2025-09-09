
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:injectable/injectable.dart';

  import '../../domain/usecase/get_movies_list_usecase.dart';
  import 'home_states.dart';

  @injectable
  class HomeCubit extends Cubit<HomeStates>{

    final GetMoviesListUseCase _getMoviesListUseCase;

    HomeCubit(this._getMoviesListUseCase) : super(HomeInitialState());


    Future<void> getMoviesList({String? genre})async{
      emit(HomeLoadingState());

      try{
        final result = await _getMoviesListUseCase.call(genre: genre);

        emit(HomeSuccessState(result));
      }
      catch(e){
        emit(HomeErrorState(e.toString()));
      }
    }


  }