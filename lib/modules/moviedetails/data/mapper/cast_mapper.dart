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
