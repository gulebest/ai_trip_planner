import '../models/trip_itinerary_model.dart';
import '../models/trip_request_model.dart';

class MockTripRepository {
  Future<TripItineraryModel> generateTrip(TripRequestModel request) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Determine content based on destination (simple switch for demo)
    final isParis = request.destination.toLowerCase().contains('paris');
    final isTokyo = request.destination.toLowerCase().contains('tokyo');

    if (isParis) {
      return _parisItinerary(request);
    } else if (isTokyo) {
      return _tokyoItinerary(request);
    } else {
      // Generic fallback
      return _genericItinerary(request);
    }
  }

  TripItineraryModel _parisItinerary(TripRequestModel request) {
    return TripItineraryModel(
      destination: "Paris, France",
      budget: request.budget,
      durationDays: 3,
      days: [
        const DayItineraryModel(
          dayTitle: "Day 1: The Classics",
          activities: [
            ActivityModel(
              time: "09:00 AM",
              title: "Eiffel Tower",
              description:
                  "Visit the iconic iron lady. Book tickets in advance!",
              location: "Champ de Mars, 5 Av. Anatole France",
            ),
            ActivityModel(
              time: "12:30 PM",
              title: "Lunch at Le Jules Verne",
              description: "Fine dining with a view inside the Eiffel Tower.",
              location: "Eiffel Tower, 2nd Floor",
            ),
            ActivityModel(
              time: "03:00 PM",
              title: "Seine River Cruise",
              description: "Relaxing boat tour seeing the city from the water.",
              location: "Port de la Bourdonnais",
            ),
          ],
        ),
        const DayItineraryModel(
          dayTitle: "Day 2: Art & History",
          activities: [
            ActivityModel(
              time: "10:00 AM",
              title: "Louvre Museum",
              description:
                  "Home of the Mona Lisa and thousands of other works.",
              location: "Rue de Rivoli",
            ),
            ActivityModel(
              time: "02:00 PM",
              title: "Montmartre & Sacré-Cœur",
              description: "Explore the artistic hilltop district.",
              location: "Butte Montmartre",
            ),
          ],
        ),
        const DayItineraryModel(
          dayTitle: "Day 3: Shopping & Departure",
          activities: [
            ActivityModel(
              time: "11:00 AM",
              title: "Champs-Élysées",
              description: "Luxury shopping and strolling down the avenue.",
              location: "Av. des Champs-Élysées",
            ),
          ],
        ),
      ],
    );
  }

  TripItineraryModel _tokyoItinerary(TripRequestModel request) {
    return TripItineraryModel(
      destination: "Tokyo, Japan",
      budget: request.budget,
      durationDays: 3,
      days: [
        const DayItineraryModel(
          dayTitle: "Day 1: Modern Tokyo",
          activities: [
            ActivityModel(
              time: "09:00 AM",
              title: "Shibuya Crossing",
              description: "The world's busiest pedestrian crossing.",
              location: "Shibuya City",
            ),
          ],
        ),
        // Simplified for brevity
      ],
    );
  }

  TripItineraryModel _genericItinerary(TripRequestModel request) {
    return TripItineraryModel(
      destination: request.destination,
      budget: request.budget,
      durationDays: 2,
      days: [
        DayItineraryModel(
          dayTitle: "Day 1: Arrival in ${request.destination}",
          activities: [
            ActivityModel(
              time: "10:00 AM",
              title: "City Center Exploration",
              description:
                  "Walk around the main square and get vibe of the city.",
              location: "Downtown",
            ),
          ],
        ),
        const DayItineraryModel(
          dayTitle: "Day 2: Local Gems",
          activities: [
            ActivityModel(
              time: "09:00 AM",
              title: "Local Market Visit",
              description: "Try local street food and buy souvenirs.",
              location: "Central Market",
            ),
          ],
        ),
      ],
    );
  }
}
