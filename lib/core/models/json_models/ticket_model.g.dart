// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      ticket_count: (json['ticket_count'] as num).toInt(),
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'ticket_count': instance.ticket_count,
      'cost': instance.cost,
    };
