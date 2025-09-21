import 'package:route_movies_app/modules/moviedetails/data/mapper/cast_mapper.dart';
import 'package:route_movies_app/modules/moviedetails/domain/entities/movie_details_entity.dart';

import '../models/movie_details_model.dart';

extension MovieDetailsMapper on MovieDetailsModel {
  MovieDetailsEntity toEntity() {
    return MovieDetailsEntity(
      id: id ?? 0,
      url: url ?? '',
      imdbCode: imdbCode ?? '',
      title: title ?? '',
      titleEnglish: titleEnglish ?? '',
      titleLong: titleLong ?? '',
      slug: slug ?? '',
      year: year ?? 0,
      rating: rating?.toDouble() ?? 0.0,
      runtime: runtime ?? 0,
      genres: genres ?? [],
      summary: summary ?? '',
      likeCount: likeCount ?? 0,
      descriptionIntro: descriptionIntro ?? '',
      descriptionFull: descriptionFull ?? '',
      ytTrailerCode: ytTrailerCode ?? '',
      language: language ?? '',
      mpaRating: mpaRating ?? '',
      backgroundImage: backgroundImage ?? '',
      backgroundImageOriginal: backgroundImageOriginal ?? '',
      smallCoverImage: smallCoverImage ?? '',
      mediumCoverImage: mediumCoverImage ?? '',
      largeCoverImage: largeCoverImage ?? '',
      cast: cast?.map((c) => c.toEntity()).toList() ?? [],
      mediumScreenshot1: mediumScreenshot1 ?? '',
      mediumScreenshot2: mediumScreenshot2 ?? '',
      mediumScreenshot3: mediumScreenshot3 ?? '',
      largeScreenshot1: largeScreenshot1 ?? '',
      largeScreenshot2: largeScreenshot2 ?? '',
      largeScreenshot3: largeScreenshot3 ?? '',
    );
  }
}
  extension MovieDetailsEntityMapper on MovieDetailsEntity {
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "url": url,
      "imdb_code": imdbCode,
      "title": title,
      "title_english": titleEnglish,
      "title_long": titleLong,
      "slug": slug,
      "year": year,
      "rating": rating,
      "runtime": runtime,
      "genres": genres,
      "like_count": likeCount,
      "summary": summary,
      "description_intro": descriptionIntro,
      "description_full": descriptionFull,
      "yt_trailer_code": ytTrailerCode,
      "language": language,
      "mpa_rating": mpaRating,
      "background_image": backgroundImage,
      "background_image_original": backgroundImageOriginal,
      "small_cover_image": smallCoverImage,
      "medium_cover_image": mediumCoverImage,
      "large_cover_image": largeCoverImage,
      "medium_screenshot_image1": mediumScreenshot1,
      "medium_screenshot_image2": mediumScreenshot2,
      "medium_screenshot_image3": mediumScreenshot3,
      "large_screenshot_image1": largeScreenshot1,
      "large_screenshot_image2": largeScreenshot2,
      "large_screenshot_image3": largeScreenshot3,
      "cast": cast.map((c) => c.toJson()).toList(),
    };
  }
}

