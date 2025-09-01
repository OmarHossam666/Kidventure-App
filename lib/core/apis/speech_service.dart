import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:kidventure/core/apis/api_service.dart';

/// Service class for handling speech-to-text recognition
class SpeechService extends ApiService {
  final SpeechToText _speechToText;
  bool _speechEnabled = false;
  bool _isListening = false;
  bool _isInitializingSpeech = false;

  /// Callback when speech is recognized with the recognized text
  Function(String)? onSpeechResult;

  /// Callback for speech status changes
  Function(bool)? onListeningStateChanged;

  /// Callback for error handling
  Function(String)? onError;

  /// Create a new SpeechService
  SpeechService({SpeechToText? speechToText})
    : _speechToText = speechToText ?? SpeechToText();

  /// Returns whether speech recognition is available on this device
  bool get isSpeechEnabled => _speechEnabled;

  /// Returns whether the service is currently listening
  bool get isListening => _isListening;

  /// Initialize speech recognition with error handling
  Future<bool> initialize() async {
    if (_isInitializingSpeech) return _speechEnabled;

    _isInitializingSpeech = true;

    try {
      _speechEnabled = await _speechToText.initialize(
        onStatus: _onSpeechStatus,
        onError: _onSpeechError,
      );

      if (!_speechEnabled) {
        _notifyError('Speech recognition not available on this device');
      }

      return _speechEnabled;
    } catch (error) {
      _speechEnabled = false;
      _notifyError(
        'Failed to initialize speech recognition: ${error.toString()}',
      );
      return false;
    } finally {
      _isInitializingSpeech = false;
    }
  }

  /// Start listening for speech with improved error handling
  Future<bool> startListening() async {
    if (!_speechEnabled) {
      // Try to initialize again if it failed previously
      await initialize();
      if (!_speechEnabled) {
        _notifyError(
          'Cannot start listening. Speech recognition is not available.',
        );
        return false;
      }
    }

    try {
      _updateListeningState(true);

      await _speechToText.listen(
        onResult: _handleSpeechResult,
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 3),
        listenOptions: SpeechListenOptions(cancelOnError: true),
      );

      return true;
    } catch (error) {
      _updateListeningState(false);
      _notifyError('Error starting speech recognition: ${error.toString()}');
      return false;
    }
  }

  /// Stop listening for speech
  Future<void> stopListening() async {
    try {
      await _speechToText.stop();
    } catch (error) {
      _notifyError('Error stopping speech recognition: ${error.toString()}');
    } finally {
      _updateListeningState(false);
    }
  }

  /// Process speech recognition results
  void _handleSpeechResult(SpeechRecognitionResult result) {
    final recognizedWords = result.recognizedWords;

    // Only notify if we have non-empty recognized words AND it's the final result
    if (recognizedWords.isNotEmpty &&
        result.finalResult &&
        onSpeechResult != null) {
      onSpeechResult!(recognizedWords);
    }
  }

  /// Handle speech recognition status changes
  void _onSpeechStatus(String status) {
    _updateListeningState(status == 'listening');
  }

  /// Handle speech recognition errors
  void _onSpeechError(dynamic error) {
    _updateListeningState(false);
    _notifyError('Speech recognition error: ${error.toString()}');
  }

  /// Update listening state and notify listeners
  void _updateListeningState(bool listening) {
    if (_isListening != listening) {
      _isListening = listening;
      if (onListeningStateChanged != null) {
        onListeningStateChanged!(listening);
      }
    }
  }

  /// Helper method to notify about errors
  void _notifyError(String errorMessage) {
    debugPrint('SpeechService Error: $errorMessage');
    final callback = onError;
    if (callback != null) {
      callback(errorMessage);
    }
  }

  /// Clean up resources
  void dispose() {
    try {
      if (_isListening) {
        _speechToText.stop();
      }
      _speechToText.cancel();
    } catch (error) {
      debugPrint('Error disposing SpeechService: ${error.toString()}');
    }
  }
}
