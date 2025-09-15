// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
  name: json['name'] as String?,
  characterName: json['character_name'] as String?,
  smallImage: json['url_small_image'] as String?,
  imdbCode: json['imdb_code'] as String?,
);

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
  'name': instance.name,
  'character_name': instance.characterName,
  'url_small_image': instance.smallImage,
  'imdb_code': instance.imdbCode,
};
