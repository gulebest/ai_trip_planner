import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/trip_itinerary_model.dart';
import '../models/trip_request_model.dart';

/// Talks to our own backend (Render), not directly to AI providers.
class TripApiClient {
  TripApiClient({String? baseUrl})
    : _baseUrl =
          baseUrl ??
          const String.fromEnvironment(
            'RENDER_BACKEND_URL',
            defaultValue: 'http://10.0.2.2:10000',
          );

  final String _baseUrl;

  /// Required function: sends a prompt to backend and returns generated trip JSON text.
  Future<String> generateTrip(String prompt) async {
    final trimmedPrompt = prompt.trim();
    if (trimmedPrompt.isEmpty) {
      throw Exception('Prompt cannot be empty.');
    }
    if (trimmedPrompt.length > 2000) {
      throw Exception('Prompt is too long. Please keep it under 2000 chars.');
    }

    final uri = Uri.parse('$_baseUrl/generate-trip');
    final response = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'prompt': trimmedPrompt}),
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception('Backend error (${response.statusCode}): ${response.body}');
    }

    final Map<String, dynamic> payload =
        jsonDecode(response.body) as Map<String, dynamic>;
    final trip = payload['trip'];
    if (trip is! String || trip.trim().isEmpty) {
      throw Exception('Invalid backend response: missing trip text.');
    }

    return trip;
  }
}

class OpenRouterTripRepository {
  OpenRouterTripRepository({TripApiClient? apiClient})
    : _apiClient = apiClient ?? TripApiClient();

  final TripApiClient _apiClient;

  Future<List<String>> listAllModels() async {
    return const ['Model execution handled by Render backend'];
  }

  Future<TripItineraryModel> generateTrip(TripRequestModel request) async {
    final prompt = _buildPrompt(request);
    final tripJsonText = await _apiClient.generateTrip(prompt);

    final Map<String, dynamic> decoded =
        jsonDecode(_cleanJsonOutput(tripJsonText)) as Map<String, dynamic>;
    return TripItineraryModel.fromJson(decoded);
  }

  String _buildPrompt(TripRequestModel request) {
    final int days = request.endDate.difference(request.startDate).inDays + 1;
    return '''
You are an expert travel planner. Create a realistic itinerary and return ONLY valid JSON.
Schema:
{
  "destination": "City, Country",
  "budget": "Estimated total cost string",
  "durationDays": 3,
  "days": [
    {
      "dayTitle": "Day 1: Title",
      "activities": [
        {
          "time": "09:00 AM",
          "title": "Activity Name",
          "description": "Brief description",
          "location": "Location Name",
          "isBooked": false
        }
      ]
    }
  ]
}

Destination: ${request.destination}
Dates: ${request.startDate.toIso8601String()} to ${request.endDate.toIso8601String()}
Duration: $days days
Budget: ${request.budget}
Travelers: ${request.travelers}
Interests: ${request.interests.join(', ')}
''';
  }

  String _cleanJsonOutput(String input) {
    String cleaned = input.trim();
    if (cleaned.startsWith('```json')) {
      cleaned = cleaned.replaceFirst('```json', '');
    }
    if (cleaned.startsWith('```')) {
      cleaned = cleaned.replaceFirst('```', '');
    }
    if (cleaned.endsWith('```')) {
      cleaned = cleaned.substring(0, cleaned.length - 3);
    }

    final int startIndex = cleaned.indexOf('{');
    final int endIndex = cleaned.lastIndexOf('}');
    if (startIndex != -1 && endIndex != -1 && endIndex >= startIndex) {
      cleaned = cleaned.substring(startIndex, endIndex + 1);
    }
    return cleaned.trim();
  }
}
