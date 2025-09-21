import '../../domain/entity/movie_entity.dart';
import '../models/movie_model.dart';

extension MovieModelMapper on MovieModel {
  Movies toEntity() {
    return Movies(
      id: id,
      url: url,
      imdbCode: imdbCode,
      title: title,
      titleEnglish: titleEnglish,
      titleLong: titleLong,
      slug: slug,
      year: year,
      rating: rating,
      runtime: runtime,
      genres: genres,
      summary: summary,
      descriptionFull: descriptionFull,
      synopsis: synopsis,
      ytTrailerCode: ytTrailerCode,
      language: language,
      mpaRating: mpaRating,
      backgroundImage: backgroundImage,
      backgroundImageOriginal: backgroundImageOriginal,
      smallCoverImage: smallCoverImage,
      mediumCoverImage: mediumCoverImage,
      largeCoverImage: largeCoverImage,
      state: state,
      torrents: null,
      dateUploaded: dateUploaded,
      dateUploadedUnix: dateUploadedUnix,
    );
  }
}
