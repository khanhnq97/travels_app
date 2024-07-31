// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightImpl _$$FlightImplFromJson(Map<String, dynamic> json) => _$FlightImpl(
      id: json['id'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      date: DateTime.parse(json['date'] as String),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$FlightImplToJson(_$FlightImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'date': instance.date.toIso8601String(),
      'price': instance.price,
    };
