// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_itinerary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripItineraryModelImpl _$$TripItineraryModelImplFromJson(
  Map<String, dynamic> json,
) => _$TripItineraryModelImpl(
  destination: json['destination'] as String,
  budget: json['budget'] as String,
  durationDays: (json['durationDays'] as num).toInt(),
  days: (json['days'] as List<dynamic>)
      .map((e) => DayItineraryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$TripItineraryModelImplToJson(
  _$TripItineraryModelImpl instance,
) => <String, dynamic>{
  'destination': instance.destination,
  'budget': instance.budget,
  'durationDays': instance.durationDays,
  'days': instance.days,
};

_$DayItineraryModelImpl _$$DayItineraryModelImplFromJson(
  Map<String, dynamic> json,
) => _$DayItineraryModelImpl(
  dayTitle: json['dayTitle'] as String,
  activities: (json['activities'] as List<dynamic>)
      .map((e) => ActivityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$DayItineraryModelImplToJson(
  _$DayItineraryModelImpl instance,
) => <String, dynamic>{
  'dayTitle': instance.dayTitle,
  'activities': instance.activities,
};

_$ActivityModelImpl _$$ActivityModelImplFromJson(Map<String, dynamic> json) =>
    _$ActivityModelImpl(
      time: json['time'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      isBooked: json['isBooked'] as bool? ?? false,
    );

Map<String, dynamic> _$$ActivityModelImplToJson(_$ActivityModelImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'isBooked': instance.isBooked,
    };
