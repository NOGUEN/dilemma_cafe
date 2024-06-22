import 'package:json_annotation/json_annotation.dart';

part 'dillema_model.g.dart';

@JsonSerializable()
class DillemaModel {
  final String title;
  final int dillemaId;
  final String? description;
  final String dillema1;
  final String dillema2;
  final String? image1;
  final String? image2;
  final int like;
  final DateTime uploadDate;
  final String authorNickname;
  final int authorId;

  DillemaModel({
    required this.title,
    required this.dillemaId,
    this.description,
    required this.dillema1,
    required this.dillema2,
    this.image1,
    this.image2,
    required this.like,
    required this.uploadDate,
    required this.authorNickname,
    required this.authorId,
  });

  factory DillemaModel.fromJson(Map<String, dynamic> json) =>
      _$DillemaModelFromJson(json);

  Map<String, dynamic> toJson() => _$DillemaModelToJson(this);
}
