import '../../../moviedetails/domain/entities/movie_details_entity.dart';

sealed class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<MovieDetailsEntity> movies;
  HistoryLoaded(this.movies);
}

class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}
