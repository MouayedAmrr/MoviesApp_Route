
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
