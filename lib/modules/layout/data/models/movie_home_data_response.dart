import 'package:json_annotation/json_annotation.dart';

part 'movie_home_data_response.g.dart';

@JsonSerializable()
class MovieHomeData {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'rating')
  final String rating;

  MovieHomeData({
    required this.id,
    required this.image,
    required this.rating,
  });

  factory MovieHomeData.fromJson(Map<String, dynamic> json) =>
      _$MovieHomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieHomeDataToJson(this);
}
