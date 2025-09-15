// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedMoviesResponse _$RelatedMoviesResponseFromJson(
  Map<String, dynamic> json,
) => RelatedMoviesResponse(
  data: RelatedMoviesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RelatedMoviesResponseToJson(
  RelatedMoviesResponse instance,
) => <String, dynamic>{'data': instance.data};

RelatedMoviesData _$RelatedMoviesDataFromJson(Map<String, dynamic> json) =>
    RelatedMoviesData(
      movies:
          (json['movies'] as List<dynamic>)
              .map((e) => MovieDetailsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RelatedMoviesDataToJson(RelatedMoviesData instance) =>
    <String, dynamic>{'movies': instance.movies};
