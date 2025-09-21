import 'package:json_annotation/json_annotation.dart';

part 'torrents_model.g.dart';

@JsonSerializable()
class TorrentsModel {
  final String? url;
  final String? hash;
  final String? quality;
  final int? seeds;
  final int? peers;
  final String? size;
  @JsonKey(name: 'size_bytes')
  final int? sizeBytes;
  @JsonKey(name: 'date_uploaded')
  final String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int? dateUploadedUnix;

  TorrentsModel({
    this.url,
    this.hash,
    this.quality,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory TorrentsModel.fromJson(Map<String, dynamic> json) =>
      _$TorrentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TorrentsModelToJson(this);
}
