import 'movie_entity.dart';

class Data {
  final int? movieCount;
  final int? limit;
  final int? pageNumber;
  final List<Movies>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});
}
