// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      flights: (json['flights'] as List<dynamic>)
          .map((e) => Flight.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotels: (json['hotels'] as List<dynamic>)
          .map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'flights': instance.flights,
      'hotels': instance.hotels,
    };
