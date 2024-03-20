import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel{
  @JsonKey(name: "favoriteId")
  int? favoriteId;
  @JsonKey(name: "songList")
  List<String>? songList;

  FavoriteModel({this.favoriteId, this.songList});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}