// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      dateRange: json['date_range'] as String?,
      currentDate: json['current_date'] as String?,
      description: json['description'] as String?,
      compatibility: json['compatibility'] as String?,
      mood: json['mood'] as String?,
      color: json['color'] as String?,
      luckyNumber: json['lucky_number'] as String?,
      luckyTime: json['lucky_time'] as String?,
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'date_range': instance.dateRange,
      'current_date': instance.currentDate,
      'description': instance.description,
      'compatibility': instance.compatibility,
      'mood': instance.mood,
      'color': instance.color,
      'lucky_number': instance.luckyNumber,
      'lucky_time': instance.luckyTime,
    };
