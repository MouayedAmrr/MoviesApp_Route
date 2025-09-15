// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
  Map<String, dynamic> json,
) => MovieDetailsResponse(
  data: MovieDetailsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MovieDetailsResponseToJson(
  MovieDetailsResponse instance,
) => <String, dynamic>{'data': instance.data};

MovieDetailsData _$MovieDetailsDataFromJson(Map<String, dynamic> json) =>
    MovieDetailsData(
      movie: MovieDetailsModel.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailsDataToJson(MovieDetailsData instance) =>
    <String, dynamic>{'movie': instance.movie};
