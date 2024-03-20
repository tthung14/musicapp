import 'package:json_annotation/json_annotation.dart';

part 'download_model.g.dart';

@JsonSerializable()
class DownloadModel {
  @JsonKey(name: "downloadId")
  int? downloadId;

  DownloadModel({this.downloadId});

  factory DownloadModel.fromJson(Map<String, dynamic> json) =>
      _$DownloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadModelToJson(this);
}
