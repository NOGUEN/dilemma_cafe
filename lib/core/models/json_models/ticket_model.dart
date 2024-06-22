import 'package:json_annotation/json_annotation.dart';

part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel {
  final int ticketcount;
  final double cost;

  TicketModel({
    required this.ticketcount,
    required this.cost,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}
