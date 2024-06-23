// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dilemma_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DilemmaModel _$DilemmaModelFromJson(Map<String, dynamic> json) => DilemmaModel(
      title: json['title'] as String,
      dillemaId: (json['dillemaId'] as num).toInt(),
      description: json['description'] as String?,
      dilemma1: json['dilemma1'] as String,
      dilemma2: json['dilemma2'] as String,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      like: (json['like'] as num).toInt(),
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      authorNickname: json['authorNickname'] as String,
      authorId: (json['authorId'] as num).toInt(),
    );

Map<String, dynamic> _$DilemmaModelToJson(DilemmaModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'dillemaId': instance.dillemaId,
      'description': instance.description,
      'dilemma1': instance.dilemma1,
      'dilemma2': instance.dilemma2,
      'image1': instance.image1,
      'image2': instance.image2,
      'like': instance.like,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'authorNickname': instance.authorNickname,
      'authorId': instance.authorId,
    };
