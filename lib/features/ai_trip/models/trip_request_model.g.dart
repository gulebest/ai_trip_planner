// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripRequestModelImpl _$$TripRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$TripRequestModelImpl(
  destination: json['destination'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  budget: json['budget'] as String? ?? 'Medium',
  interests:
      (json['interests'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  travelers: (json['travelers'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$$TripRequestModelImplToJson(
  _$TripRequestModelImpl instance,
) => <String, dynamic>{
  'destination': instance.destination,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'budget': instance.budget,
  'interests': instance.interests,
  'travelers': instance.travelers,
};
