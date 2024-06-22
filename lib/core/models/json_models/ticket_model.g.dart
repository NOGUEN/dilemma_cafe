// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      ticketcount: (json['ticketcount'] as num).toInt(),
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'ticketcount': instance.ticketcount,
      'cost': instance.cost,
    };
