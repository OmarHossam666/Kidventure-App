import 'package:kidventure/core/apis/gemini_service.dart';
import 'package:kidventure/core/apis/speech_service.dart';

/// A simple service locator for managing service instances
///
/// This provides a lightweight dependency injection mechanism
/// without requiring a full DI framework
class ServiceLocator {
  /// Private constructor to prevent instantiation
  ServiceLocator._();

  /// Singleton instance
  static final ServiceLocator _instance = ServiceLocator._();

  /// Get the singleton instance
  static ServiceLocator get instance => _instance;

  /// Map of service instances with stronger type safety
  final Map<Type, Object> _services = {};

  /// Register a service instance
  void register<T extends Object>(T service) {
    _services[T] = service;
  }

  /// Get a service instance
  ///
  /// Throws an error if the service is not registered
  T get<T extends Object>() {
    final service = _services[T];
    if (service == null) {
      throw Exception(
        'Service $T not found in ServiceLocator. Make sure to register it first.',
      );
    }

    // Type checking before casting
    if (service is! T) {
      throw Exception('Service registered for $T is not of the expected type.');
    }

    return service;
  }

  /// Get a service instance safely, returning null if not found
  T? getSafe<T extends Object>() {
    final service = _services[T];
    if (service == null) {
      return null;
    }

    // Type checking before casting
    if (service is! T) {
      return null;
    }

    return service;
  }

  /// Check if a service is registered
  bool isRegistered<T extends Object>() {
    return _services.containsKey(T);
  }

  /// Initialize all required services
  static Future<void> initialize({
    required String geminiApiKey,
    bool enableGeminiDebugging = false,
  }) async {
    // Initialize the Gemini API
    GeminiService.initialize(
      apiKey: geminiApiKey,
      enableDebugging: enableGeminiDebugging,
    );

    // Create service instances
    final geminiService = GeminiService();
    final speechService = SpeechService();

    // Register services with the locator
    instance.register<GeminiService>(geminiService);
    instance.register<SpeechService>(speechService);

    // Initialize services that require async initialization
    await speechService.initialize();
  }

  /// Dispose all services and clear the registry
  void dispose() {
    // Check for services with dispose methods and call them
    final speechService = getSafe<SpeechService>();
    speechService?.dispose();

    _services.clear();
  }
}
