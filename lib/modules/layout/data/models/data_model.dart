import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  @JsonKey(name: 'movie_count')
  final int? movieCount;
  final int? limit;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  final List<MovieModel>? movies;

  DataModel({
    this.movieCount,
    this.limit,
    this.pageNumber,
    this.movies,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
