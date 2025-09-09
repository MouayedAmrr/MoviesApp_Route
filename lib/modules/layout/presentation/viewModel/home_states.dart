import '../../../../models/movie_home_data_model.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeLoadingState extends HomeStates{}

class HomeSuccessState extends HomeStates{
  final MovieHomeData movieHomeData;
  HomeSuccessState(this.movieHomeData);
}

class HomeErrorState extends HomeStates{
  final String errorMsg;
  HomeErrorState(this.errorMsg);
}
