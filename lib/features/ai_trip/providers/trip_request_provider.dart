import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trip_request_model.dart';

/// Holds the current state of the trip request form
class TripRequestNotifier extends StateNotifier<TripRequestModel> {
  TripRequestNotifier()
    : super(
        TripRequestModel(
          destination: '',
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 3)),
        ),
      );

  void updateDestination(String destination) {
    state = state.copyWith(destination: destination);
  }

  void updateDates(DateTime start, DateTime end) {
    state = state.copyWith(startDate: start, endDate: end);
  }

  void updateBudget(String budget) {
    state = state.copyWith(budget: budget);
  }

  void toggleInterest(String interest) {
    final current = List<String>.from(state.interests);
    if (current.contains(interest)) {
      current.remove(interest);
    } else {
      current.add(interest);
    }
    state = state.copyWith(interests: current);
  }
}

final tripRequestProvider =
    StateNotifierProvider<TripRequestNotifier, TripRequestModel>((ref) {
      return TripRequestNotifier();
    });
