import 'package:json_annotation/json_annotation.dart';

import 'data_model.dart';

part 'movie_data_model.g.dart';

@JsonSerializable()
class MovieDataModel {
  final String? status;
  @JsonKey(name: 'status_message')
  final String? statusMessage;
  final DataModel? data;

  MovieDataModel({this.status, this.statusMessage, this.data});

  factory MovieDataModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataModelToJson(this);
}
