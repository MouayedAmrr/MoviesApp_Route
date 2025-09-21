import '../../domain/entities/cast_entity.dart';
import '../models/cast_data_model.dart';

extension CastMapper on Cast {
  CastEntity toEntity() {
    return CastEntity(
      name: name ?? '',
      characterName: characterName ?? '',
      smallImage: smallImage ?? '',
      imdbCode: imdbCode ?? '',
    );
  }
}
extension CastEntityMapper on CastEntity {
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "character_name": characterName,
      "url_small_image": smallImage,
      "imdb_code": imdbCode,
    };
  }
}