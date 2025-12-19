import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:kidventure/core/apis/api_service.dart';

/// Service class for handling all Gemini AI API interactions
class GeminiService extends ApiService {
  final Gemini _gemini;
  final String _promptInstructions;

  /// Creates a new GeminiService
  ///
  /// Uses the singleton pattern with the Gemini instance
  GeminiService({Gemini? gemini, String? customPromptInstructions})
    : _gemini = gemini ?? Gemini.instance,
      _promptInstructions =
          customPromptInstructions ?? _defaultPromptInstructions;

  /// Default instructions for the AI prompt
  static const String _defaultPromptInstructions = """
You are a friendly chatbot for kids aged 6-10. Use simple words, playful emojis, and keep answers short.
NEVER mention anything about:
- Grown-up stuff (relationships, politics, violence)
- Bad words or mean talk
- Flags or country arguments
- Anything private or scary
- Anything that is not safe for kids
- Anything that is not appropriate for kids
- Anything that is not funny
- Anything that is not educational
- Israel
- Gay

You can talk about Palastine.

If someone asks about tricky topics, say:
"Let's talk about something fun instead! 🌈 How about [suggestion]?"

talk to them as the same language as they are using.

Example response:
"That's a great question! 🎉 Did you know butterflies taste with their feet? 🦋 Let's draw one! ✏️"
""";

  /// Sends a message to the Gemini API and returns the response
  ///
  /// [messages] - List of chat messages for context
  /// Returns the AI-generated response text
  Future<String> sendMessage(List<Map<String, String>> messages) async {
    return safeApiCall<String>(() async {
      if (messages.isEmpty) {
        return "Hi there! I'm your friendly robot friend. What would you like to talk about today? 🌟";
      }

      // Build conversation history
      final List<Part> conversationParts = [Part.text(_promptInstructions)];

      for (final message in messages) {
        final role = message['role'] == 'user' ? 'User' : 'Assistant';
        final content = message['content'] ?? '';
        conversationParts.add(Part.text('$role: $content'));
      }

      // Create safety settings for kid-appropriate content
      final safetySettings = [
        SafetySetting(
          category: SafetyCategory.dangerous,
          threshold: SafetyThreshold.blockLowAndAbove,
        ),
        SafetySetting(
          category: SafetyCategory.harassment,
          threshold: SafetyThreshold.blockLowAndAbove,
        ),
        SafetySetting(
          category: SafetyCategory.hateSpeech,
          threshold: SafetyThreshold.blockLowAndAbove,
        ),
        SafetySetting(
          category: SafetyCategory.sexuallyExplicit,
          threshold: SafetyThreshold.blockLowAndAbove,
        ),
      ];

      // Make the API call
      final response = await _gemini.prompt(
        parts: conversationParts,
        safetySettings: safetySettings,
      );

      // Return the response text or an error message
      final output = response?.output;
      if (output == null || output.isEmpty) {
        return 'Oops! My brain got a little tired. Let\'s try again in a bit, okay? Maybe we can talk about dinosaurs or space next time! 🚀✨';
      }

      return output;
    });
  }

  /// Initializes the Gemini API with the provided API key
  ///
  /// [apiKey] - The API key to use for Gemini
  /// [enableDebugging] - Whether to enable debugging
  static void initialize({
    required String apiKey,
    bool enableDebugging = false,
  }) {
    Gemini.init(apiKey: apiKey, enableDebugging: enableDebugging);
  }
}
