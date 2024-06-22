// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dillema_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DillemaModel _$DillemaModelFromJson(Map<String, dynamic> json) => DillemaModel(
      title: json['title'] as String,
      dillemaId: (json['dillemaId'] as num).toInt(),
      description: json['description'] as String?,
      dillema1: json['dillema1'] as String,
      dillema2: json['dillema2'] as String,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      like: (json['like'] as num).toInt(),
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      authorNickname: json['authorNickname'] as String,
      authorId: (json['authorId'] as num).toInt(),
    );

Map<String, dynamic> _$DillemaModelToJson(DillemaModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'dillemaId': instance.dillemaId,
      'description': instance.description,
      'dillema1': instance.dillema1,
      'dillema2': instance.dillema2,
      'image1': instance.image1,
      'image2': instance.image2,
      'like': instance.like,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'authorNickname': instance.authorNickname,
      'authorId': instance.authorId,
    };
