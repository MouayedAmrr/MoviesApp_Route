import 'package:json_annotation/json_annotation.dart';

part 'cast_data_model.g.dart';

@JsonSerializable()
class Cast {
  final String? name;
  @JsonKey(name: "character_name")
  final String? characterName;
  @JsonKey(name: "url_small_image")
  final String? smallImage;
  @JsonKey(name: "imdb_code")
  final String? imdbCode;

  Cast({this.name, this.characterName, this.smallImage, this.imdbCode});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}
