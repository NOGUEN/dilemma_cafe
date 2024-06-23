import 'package:json_annotation/json_annotation.dart';

part 'dilemma_model.g.dart';

@JsonSerializable()
class DilemmaModel {
  final String title;
  final int dillemaId;
  final String? description;
  final String dilemma1;
  final String dilemma2;
  final String? image1;
  final String? image2;
  final int like;
  final DateTime uploadDate;
  final String authorNickname;
  final int authorId;

  DilemmaModel({
    required this.title,
    required this.dillemaId,
    this.description,
    required this.dilemma1,
    required this.dilemma2,
    this.image1,
    this.image2,
    required this.like,
    required this.uploadDate,
    required this.authorNickname,
    required this.authorId,
  });

  factory DilemmaModel.fromJson(Map<String, dynamic> json) =>
      _$DilemmaModelFromJson(json);

  Map<String, dynamic> toJson() => _$DilemmaModelToJson(this);
}
