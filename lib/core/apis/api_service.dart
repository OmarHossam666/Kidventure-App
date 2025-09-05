import 'package:flutter/foundation.dart';

/// Base class for all API services providing common functionality
abstract class ApiService {
  /// Executes an API call with proper error handling
  Future<T> safeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } catch (e) {
      debugPrint('API Error: ${e.toString()}');
      rethrow;
    }
  }
}
