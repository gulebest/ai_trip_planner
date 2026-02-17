import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart' as genai;
import '../../../../shared/env.dart';
import '../models/trip_itinerary_model.dart';
import '../models/trip_request_model.dart';

class GeminiTripRepository {
  final String _apiKey = Env.geminiApiKey;

  // listing models is removed to fix compilation errors
  Future<List<String>> listAllModels() async {
    return ['Debug model listing disabled.'];
  }

  Future<TripItineraryModel> generateTrip(TripRequestModel request) async {
    print('Using API Key starts with: ${_apiKey.substring(0, 5)}...');
    const modelName = 'gemini-1.5-flash-8b';
    print('Attempting model: $modelName');

    try {
      final model = genai.GenerativeModel(model: modelName, apiKey: _apiKey);

      final prompt = _buildPrompt(request);
      final content = [genai.Content.text(prompt)];

      final response = await model.generateContent(content);
      return _parseResponse(response);
    } catch (e) {
      print('Model gemini-1.5-flash failed: $e');
      throw Exception(
        'The AI model failed to generate a trip. Please check your API key and quota. Error: $e',
      );
    }
  }

  TripItineraryModel _parseResponse(genai.GenerateContentResponse response) {
    if (response.text == null) {
      throw Exception('Empty response from AI model.');
    }

    final jsonString = _cleanJson(response.text!);
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return TripItineraryModel.fromJson(jsonMap);
  }

  String _buildPrompt(TripRequestModel request) {
    return '''
    Act as an expert travel planner. Create a detailed itinerary for a trip to ${request.destination}.
    
    Details:
    - Dates: ${request.startDate.toString().split(' ')[0]} to ${request.endDate.toString().split(' ')[0]}
    - Budget: \$${request.budget}
    - Interests: ${request.interests.join(', ')}
    
    Requirements:
    - Provide a day-by-day plan.
    - Include specific times, activity titles, short descriptions, and locations.
    - Suggest mostly real places.
    
    Output Format:
    Return ONLY valid JSON (no markdown code blocks, no explanation text).
    The JSON structure must strictly follow this schema:
    {
      "destination": "City, Country",
      "budget": "Estimated total cost string (e.g. \$1200)",
      "durationDays": (integer),
      "days": [
        {
          "dayTitle": "Day 1: Title",
          "activities": [
            {
              "time": "Time (e.g. 09:00 AM)",
              "title": "Activity Name",
              "description": "Brief description",
              "location": "Location Name or Address",
              "isBooked": false
            }
          ]
        }
      ]
    }
    ''';
  }

  String _cleanJson(String text) {
    // Remove markdown code blocks if present
    String clean = text.replaceAll('```json', '').replaceAll('```', '').trim();
    // Sometimes the model might add extra text before/after JSON, try to find the braces
    final startIndex = clean.indexOf('{');
    final endIndex = clean.lastIndexOf('}');
    if (startIndex != -1 && endIndex != -1) {
      clean = clean.substring(startIndex, endIndex + 1);
    }
    return clean;
  }
}
