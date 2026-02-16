import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_itinerary_model.freezed.dart';
part 'trip_itinerary_model.g.dart';

@freezed
class TripItineraryModel with _$TripItineraryModel {
  const factory TripItineraryModel({
    required String destination,
    required String budget,
    required int durationDays,
    required List<DayItineraryModel> days,
  }) = _TripItineraryModel;

  factory TripItineraryModel.fromJson(Map<String, dynamic> json) =>
      _$TripItineraryModelFromJson(json);
}

@freezed
class DayItineraryModel with _$DayItineraryModel {
  const factory DayItineraryModel({
    required String dayTitle,
    required List<ActivityModel> activities,
  }) = _DayItineraryModel;

  factory DayItineraryModel.fromJson(Map<String, dynamic> json) =>
      _$DayItineraryModelFromJson(json);
}

@freezed
class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    required String time, // e.g. "10:00 AM"
    required String title, // e.g. "Visit Eiffel Tower"
    required String description,
    required String location,
    @Default(false) bool isBooked,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}
