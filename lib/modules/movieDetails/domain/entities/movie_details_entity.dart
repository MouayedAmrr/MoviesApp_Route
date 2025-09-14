import 'cast_entity.dart';

class MovieDetailsEntity {
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final int likeCount;
  final String descriptionIntro;
  final String descriptionFull;
  final String ytTrailerCode;
  final String language;
  final String mpaRating;
  final String summary;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final List<CastEntity> cast;

  final String mediumScreenshot1;
  final String mediumScreenshot2;
  final String mediumScreenshot3;
  final String largeScreenshot1;
  final String largeScreenshot2;
  final String largeScreenshot3;

  MovieDetailsEntity({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.summary,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.cast,
    required this.mediumScreenshot1,
    required this.mediumScreenshot2,
    required this.mediumScreenshot3,
    required this.largeScreenshot1,
    required this.largeScreenshot2,
    required this.largeScreenshot3,
  });
}
