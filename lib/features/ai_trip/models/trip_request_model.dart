import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_request_model.freezed.dart';
part 'trip_request_model.g.dart';

@freezed
class TripRequestModel with _$TripRequestModel {
  const factory TripRequestModel({
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
    @Default('Medium') String budget, // Low, Medium, High, Luxury
    @Default([]) List<String> interests, // food, history, nature
    @Default(1) int travelers,
  }) = _TripRequestModel;

  factory TripRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TripRequestModelFromJson(json);
}
