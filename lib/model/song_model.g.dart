// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongModel _$SongModelFromJson(Map<String, dynamic> json) => SongModel(
      songId: json['songId'] as int?,
      description: json['description'] as String?,
      songName: json['songName'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$SongModelToJson(SongModel instance) => <String, dynamic>{
      'songId': instance.songId,
      'songName': instance.songName,
      'description': instance.description,
      'photo': instance.photo,
    };
