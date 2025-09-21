// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      imdbCode: json['imdb_code'] as String?,
      title: json['title'] as String?,
      titleEnglish: json['title_english'] as String?,
      titleLong: json['title_long'] as String?,
      slug: json['slug'] as String?,
      year: (json['year'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: (json['runtime'] as num?)?.toInt(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      summary: json['summary'] as String?,
      descriptionFull: json['description_full'] as String?,
      synopsis: json['synopsis'] as String?,
      ytTrailerCode: json['yt_trailer_code'] as String?,
      language: json['language'] as String?,
      mpaRating: json['mpa_rating'] as String?,
      backgroundImage: json['background_image'] as String?,
      backgroundImageOriginal: json['background_image_original'] as String?,
      smallCoverImage: json['small_cover_image'] as String?,
      mediumCoverImage: json['medium_cover_image'] as String?,
      largeCoverImage: json['large_cover_image'] as String?,
      state: json['state'] as String?,
      torrents: (json['torrents'] as List<dynamic>?)
          ?.map((e) => TorrentsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateUploaded: json['date_uploaded'] as String?,
      dateUploadedUnix: (json['date_uploaded_unix'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'imdb_code': instance.imdbCode,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'title_long': instance.titleLong,
      'slug': instance.slug,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'summary': instance.summary,
      'description_full': instance.descriptionFull,
      'synopsis': instance.synopsis,
      'yt_trailer_code': instance.ytTrailerCode,
      'language': instance.language,
      'mpa_rating': instance.mpaRating,
      'background_image': instance.backgroundImage,
      'background_image_original': instance.backgroundImageOriginal,
      'small_cover_image': instance.smallCoverImage,
      'medium_cover_image': instance.mediumCoverImage,
      'large_cover_image': instance.largeCoverImage,
      'state': instance.state,
      'torrents': instance.torrents,
      'date_uploaded': instance.dateUploaded,
      'date_uploaded_unix': instance.dateUploadedUnix,
    };
