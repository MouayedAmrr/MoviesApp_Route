import 'package:json_annotation/json_annotation.dart';
import 'package:route_movies_app/modules/layout/data/models/torrents_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int? id;
  final String? url;
  @JsonKey(name: 'imdb_code')
  final String? imdbCode;
  final String? title;
  @JsonKey(name: 'title_english')
  final String? titleEnglish;
  @JsonKey(name: 'title_long')
  final String? titleLong;
  final String? slug;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  @JsonKey(name: 'description_full')
  final String? descriptionFull;
  final String? synopsis;
  @JsonKey(name: 'yt_trailer_code')
  final String? ytTrailerCode;
  final String? language;
  @JsonKey(name: 'mpa_rating')
  final String? mpaRating;
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @JsonKey(name: 'background_image_original')
  final String? backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
  final String? smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
  final String? mediumCoverImage;
  @JsonKey(name: 'large_cover_image')
  final String? largeCoverImage;
  final String? state;
  final List<TorrentsModel>? torrents;
  @JsonKey(name: 'date_uploaded')
  final String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int? dateUploadedUnix;

  MovieModel({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
