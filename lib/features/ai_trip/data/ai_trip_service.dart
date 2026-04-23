import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --- RIVERPOD PROVIDER ---
// This provider is responsible for making the service globally available
// across the Flutter app cleanly.
final aiTripServiceProvider = Provider<AITripService>((ref) {
  // Automatically choose correct local IP based on the platform running the app:
  // Use your PC's local Wi-Fi IP address so physical phones can reach the Node server!
  String backendUrl = 'http://192.168.137.97:3002';

  if (!kIsWeb && Platform.isAndroid) {
    backendUrl = 'http://192.168.137.97:3002';
  }

  return AITripService(baseUrl: backendUrl);
});

// --- MODELS ---

// Model representing the user's input request
class TripRequest {
  final String destination;
  final String budget;
  final int duration;
  final List<String> interests;

  TripRequest({
    required this.destination,
    required this.budget,
    required this.duration,
    required this.interests,
  });

  Map<String, dynamic> toJson() => {
    'destination': destination,
    'budget': budget,
    'duration': duration,
    'interests': interests,
  };
}

// Models representing the parsed JSON response
class GeneratedTrip {
  final String destination;
  final List<TripDay> days;

  GeneratedTrip({required this.destination, required this.days});

  factory GeneratedTrip.fromJson(Map<String, dynamic> json) {
    return GeneratedTrip(
      destination: json['destination'] ?? 'Unknown Destination',
      days:
          (json['days'] as List<dynamic>?)
              ?.map((e) => TripDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class TripDay {
  final String dayTitle;
  final List<TripActivity> activities;

  TripDay({required this.dayTitle, required this.activities});

  factory TripDay.fromJson(Map<String, dynamic> json) {
    return TripDay(
      dayTitle: json['dayTitle'] ?? 'Day 1',
      activities:
          (json['activities'] as List<dynamic>?)
              ?.map((e) => TripActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class TripActivity {
  final String time;
  final String title;
  final String description;
  final String location;

  TripActivity({
    required this.time,
    required this.title,
    required this.description,
    required this.location,
  });

  factory TripActivity.fromJson(Map<String, dynamic> json) {
    return TripActivity(
      time: json['time']?.toString().isNotEmpty == true
          ? json['time']
          : 'All Day',
      title: json['title']?.toString().isNotEmpty == true
          ? json['title']
          : 'Activity',
      description: json['description']?.toString().isNotEmpty == true
          ? json['description']
          : 'No description provided.',
      location: json['location']?.toString().isNotEmpty == true
          ? json['location']
          : 'Local Spot',
    );
  }
}

// --- SERVICE ---
class AITripService {
  final String baseUrl;

  AITripService({required this.baseUrl});

  Future<GeneratedTrip> generateTrip(TripRequest request) async {
    final url = Uri.parse('$baseUrl/generate-trip');

    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(request.toJson()),
          )
          .timeout(
            const Duration(seconds: 120),
          ); // LLMs can take time to respond

      // Parse errors from the backend securely
      if (response.statusCode != 200) {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error'] ?? 'Unknown server error';

        if (response.statusCode == 401) {
          throw Exception('Backend Configuration Error: ' + errorMessage);
        } else if (response.statusCode == 429) {
          throw Exception('Rate Limit: ' + errorMessage);
        } else if (response.statusCode == 502) {
          throw Exception('AI Model Error: ' + errorMessage);
        } else {
          throw Exception(
            'Backend Error (${response.statusCode}): ' + errorMessage,
          );
        }
      }

      // Successful JSON response expected
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Convert JSON into Dart Models
      return GeneratedTrip.fromJson(data);
    } catch (e) {
      // Re-throw exceptions to be caught and shown to the UI layer
      throw Exception('Failed to generate trip: $e');
    }
  }
}
