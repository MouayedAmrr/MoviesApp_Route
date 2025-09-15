import 'package:json_annotation/json_annotation.dart';
import 'movie_details_model.dart';

part 'related_movies_response_model.g.dart';

@JsonSerializable()
class RelatedMoviesResponse {
  final RelatedMoviesData data;

  RelatedMoviesResponse({required this.data});

  factory RelatedMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$RelatedMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedMoviesResponseToJson(this);
}

@JsonSerializable()
class RelatedMoviesData {
  final List<MovieDetailsModel> movies;

  RelatedMoviesData({required this.movies});

  factory RelatedMoviesData.fromJson(Map<String, dynamic> json) =>
      _$RelatedMoviesDataFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedMoviesDataToJson(this);
}
