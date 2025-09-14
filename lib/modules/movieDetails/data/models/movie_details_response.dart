import 'package:json_annotation/json_annotation.dart';
import 'movie_details_model.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  final MovieDetailsData data;

  MovieDetailsResponse({required this.data});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}

@JsonSerializable()
class MovieDetailsData {
  final MovieDetailsModel movie;

  MovieDetailsData({required this.movie});

  factory MovieDetailsData.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsDataToJson(this);
}


