// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrents_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TorrentsModel _$TorrentsModelFromJson(Map<String, dynamic> json) =>
    TorrentsModel(
      url: json['url'] as String?,
      hash: json['hash'] as String?,
      quality: json['quality'] as String?,
      seeds: (json['seeds'] as num?)?.toInt(),
      peers: (json['peers'] as num?)?.toInt(),
      size: json['size'] as String?,
      sizeBytes: (json['size_bytes'] as num?)?.toInt(),
      dateUploaded: json['date_uploaded'] as String?,
      dateUploadedUnix: (json['date_uploaded_unix'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TorrentsModelToJson(TorrentsModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'hash': instance.hash,
      'quality': instance.quality,
      'seeds': instance.seeds,
      'peers': instance.peers,
      'size': instance.size,
      'size_bytes': instance.sizeBytes,
      'date_uploaded': instance.dateUploaded,
      'date_uploaded_unix': instance.dateUploadedUnix,
    };
