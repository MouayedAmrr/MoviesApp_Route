import 'package:json_annotation/json_annotation.dart';

import 'cast_data_model.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "imdb_code")
  final String? imdbCode;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "title_english")
  final String? titleEnglish;
  @JsonKey(name: "title_long")
  final String? titleLong;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "year")
  final int? year;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "genres")
  final List<String>? genres;
  @JsonKey(name: "like_count")
  final int? likeCount;
  @JsonKey(name: "description_intro")
  final String? descriptionIntro;
  @JsonKey(name: "description_full")
  final String? descriptionFull;
  @JsonKey(name: "yt_trailer_code")
  final String? ytTrailerCode;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "mpa_rating")
  final String? mpaRating;
  @JsonKey(name: "background_image")
  final String? backgroundImage;
  @JsonKey(name: "background_image_original")
  final String? backgroundImageOriginal;
  @JsonKey(name: "small_cover_image")
  final String? smallCoverImage;
  @JsonKey(name: "medium_cover_image")
  final String? mediumCoverImage;
  @JsonKey(name: "large_cover_image")
  final String? largeCoverImage;

  @JsonKey(name: "medium_screenshot_image1")
  final String? mediumScreenshot1;
  @JsonKey(name: "medium_screenshot_image2")
  final String? mediumScreenshot2;
  @JsonKey(name: "medium_screenshot_image3")
  final String? mediumScreenshot3;
  @JsonKey(name: "large_screenshot_image1")
  final String? largeScreenshot1;
  @JsonKey(name: "large_screenshot_image2")
  final String? largeScreenshot2;
  @JsonKey(name: "large_screenshot_image3")
  final String? largeScreenshot3;

  @JsonKey(name: "cast")
  final List<Cast>? cast;

  MovieDetailsModel({
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
    this.likeCount,
    this.descriptionIntro,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.mediumScreenshot1,
    this.mediumScreenshot2,
    this.mediumScreenshot3,
    this.largeScreenshot1,
    this.largeScreenshot2,
    this.largeScreenshot3,
    this.cast,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
