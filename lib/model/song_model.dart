import 'package:json_annotation/json_annotation.dart';
part 'song_model.g.dart';

@JsonSerializable()
class SongModel {
  @JsonKey(name: "songId")
  int? songId;
  @JsonKey(name: "songName")
  String? songName;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "photo")
  String? photo;

  SongModel({this.songId, this.description, this.songName, this.photo});

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);

  Map<String, dynamic> toJson() => _$SongModelToJson(this);
}
