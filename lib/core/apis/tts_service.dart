import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

class TtsService {
  // Singleton pattern
  static final TtsService _instance = TtsService._internal();
  factory TtsService() => _instance;
  TtsService._internal();

  FlutterTts? _flutterTts;
  TtsState _ttsState = TtsState.stopped;
  final bool _isAndroid = !kIsWeb && Platform.isAndroid;
  final bool _isIOS = !kIsWeb && Platform.isIOS;

  Function? onStartCallback;
  Function? onCompletionCallback;
  Function? onErrorCallback;
  Function? onPauseCallback;
  Function? onContinueCallback;

  bool get isPlaying => _ttsState == TtsState.playing;
  bool get isStopped => _ttsState == TtsState.stopped;
  bool get isPaused => _ttsState == TtsState.paused;

  /// Initialize the TTS service
  Future<void> initialize() async {
    _flutterTts = FlutterTts();

    if (_flutterTts == null) {
      return;
    }

    // Set up event handlers
    _flutterTts!.setStartHandler(() {
      _ttsState = TtsState.playing;
      if (onStartCallback != null) {
        onStartCallback!();
      }
    });

    _flutterTts!.setCompletionHandler(() {
      _ttsState = TtsState.stopped;
      if (onCompletionCallback != null) {
        onCompletionCallback!();
      }
    });

    _flutterTts!.setErrorHandler((message) {
      _ttsState = TtsState.stopped;
      if (onErrorCallback != null) {
        onErrorCallback!(message);
      }
    });

    _flutterTts!.setPauseHandler(() {
      _ttsState = TtsState.paused;
      if (onPauseCallback != null) {
        onPauseCallback!();
      }
    });

    _flutterTts!.setContinueHandler(() {
      _ttsState = TtsState.continued;
      if (onContinueCallback != null) {
        onContinueCallback!();
      }
    });

    // Configure TTS settings for child-friendly voice
    await _flutterTts!.setLanguage("en-US");
    await _flutterTts!.setPitch(
      1.1,
    ); // Slightly higher pitch for a child-friendly female voice
    await _flutterTts!.setSpeechRate(0.5); // Slower speech rate for children
    await _flutterTts!.setVolume(1.0);

    // Try to set a female voice if available
    await _setFemaleVoice();

    // Platform-specific settings
    if (_isAndroid) {
      await _configureAndroid();
    } else if (_isIOS) {
      await _configureIOS();
    }
  }

  /// Configure Android-specific settings
  Future<void> _configureAndroid() async {
    // Set audio focus for Android
    await _flutterTts!.setQueueMode(1);
    // Initialize TTS with empty text to set up audio focus
    await _flutterTts!.speak("");
    await _flutterTts!.stop(); //? stop or pause ?
  }

  /// Configure iOS-specific settings
  Future<void> _configureIOS() async {
    await _flutterTts!.setSharedInstance(true);
    await _flutterTts!
        .setIosAudioCategory(IosTextToSpeechAudioCategory.ambient, [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        ], IosTextToSpeechAudioMode.voicePrompt);
  }

  /// Attempt to set a female voice
  Future<void> _setFemaleVoice() async {
    try {
      List<Map>? voices = await _flutterTts!.getVoices;

      if (voices != null && voices.isNotEmpty) {
        // Try to find a female US English voice
        Map? femaleVoice = voices.firstWhere(
          (voice) =>
              voice['locale'] == 'en-US' &&
              (voice['gender'] == 'female' ||
                  voice['name'].toString().toLowerCase().contains('female')),
          orElse:
              () => voices.firstWhere(
                (voice) => voice['locale'] == 'en-US',
                orElse: () => voices.first,
              ),
        );

        if (_isIOS && femaleVoice.containsKey('identifier')) {
          await _flutterTts!.setVoice({
            "identifier": femaleVoice['identifier'],
          });
        } else {
          await _flutterTts!.setVoice({
            "name": femaleVoice['name'],
            "locale": femaleVoice['locale'],
          });
        }
      }
    } catch (error) {
      debugPrint('Error setting female voice: $error');
    }
  }

  /// Speak the provided text
  Future<void> speak(String text) async {
    if (_flutterTts == null) {
      await initialize();
    }

    if (text.isNotEmpty) {
      await _flutterTts!.speak(text);
    }
  }

  /// Stop speaking
  Future<void> stop() async {
    if (_flutterTts != null) {
      await _flutterTts!.stop();
    }
  }

  /// Pause speaking (SDK version >= 26 for Android)
  Future<void> pause() async {
    if (_flutterTts != null && (_isIOS || _isAndroid)) {
      await _flutterTts!.pause();
    }
  }

  /// Dispose TTS resources
  Future<void> dispose() async {
    if (_flutterTts != null) {
      await _flutterTts!.stop();
      _flutterTts = null;
    }
  }
}
