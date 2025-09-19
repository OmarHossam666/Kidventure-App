import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../models/camera_position.dart';
import '../models/celestial_body.dart';
import 'widgets/celestial_info_overlay.dart';
import 'widgets/glb_model_viewer.dart';
import 'widgets/obj_model_viewer.dart';
import 'widgets/starry_background.dart';

class ThreeDimensionalViewScreen extends StatefulWidget {
  const ThreeDimensionalViewScreen({
    super.key,
    required this.modelPath,
    required this.celestialBody,
    this.scale = 5.0,
    this.cameraPosition = const CameraPosition(0, 0, 10),
  });

  final String modelPath;
  final CelestialBody celestialBody;
  final double scale;
  final CameraPosition cameraPosition;

  @override
  State<ThreeDimensionalViewScreen> createState() =>
      _ThreeDimensionalViewScreenState();
}

class _ThreeDimensionalViewScreenState extends State<ThreeDimensionalViewScreen>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<GlbModelViewerState> _glbViewerKey = GlobalKey();
  bool _isModelLoaded = false;
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  double _currentZoom = 5.0;
  static const double _minZoom = 2.0;
  static const double _maxZoom = 15.0;
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  Timer? _loadingTimeout;
  Timer? _debounceTimer;

  bool get _isGlbModel => widget.modelPath.toLowerCase().endsWith('.glb');

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    // Set timeout for model loading
    _loadingTimeout = Timer(const Duration(seconds: 30), () {
      if (mounted && _isLoading) {
        setState(() {
          _isLoading = false;
          _hasError = true;
          _errorMessage = 'Model loading timed out. Please try again later.';
        });
      }
    });

    // Immediately start loading non-GLB models
    if (!_isGlbModel) {
      Future.microtask(() {
        if (mounted) {
          try {
            setState(() {
              _isModelLoaded = true;
              _isLoading = false;
            });
          } catch (error) {
            _handleError('Failed to load model: $error');
          }
        }
      });
    }
  }

  void _handleError(String message) {
    if (mounted) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = message;
      });
    }
  }

  @override
  void dispose() {
    _loadingTimeout?.cancel();
    _debounceTimer?.cancel();
    // Clean up any other resources
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text("3D View", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(child: _buildModelViewer()),
      floatingActionButton:
          _isModelLoaded && !_hasError ? _buildControlPanel() : null,
    );
  }

  Widget _buildModelViewer() {
    if (_hasError) {
      return _buildErrorView();
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        const RepaintBoundary(child: StarryBackground()),
        if (_isGlbModel)
          Center(
            child: GestureDetector(
              onScaleUpdate: _handleScaleUpdate,
              child: GlbModelViewer(
                key: _glbViewerKey,
                modelPath: widget.modelPath,
                onLoadStateChanged: _handleModelLoadState,
              ),
            ),
          )
        else
          Center(
            child: GestureDetector(
              onScaleUpdate: _handleScaleUpdate,
              child: ObjModelViewer(
                modelPath: widget.modelPath,
                scale: widget.scale,
                cameraPosition: widget.cameraPosition,
              ),
            ),
          ),
        if (_isLoading) _buildLoadingIndicator(),
        CelestialInfoOverlay(
          celestialBody: widget.celestialBody,
          isVisible: _isModelLoaded || !_isGlbModel,
        ),
      ],
    );
  }

  Widget _buildErrorView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/lotties/error_lottie.json'),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red[300], size: 60),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                _errorMessage,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _retryLoading,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text('Retry'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                'Go Back',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _retryLoading() {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _hasError = false;
        _errorMessage = '';
      });

      // Reset timeout
      _loadingTimeout?.cancel();
      _loadingTimeout = Timer(const Duration(seconds: 30), () {
        if (mounted && _isLoading) {
          setState(() {
            _isLoading = false;
            _hasError = true;
            _errorMessage = 'Model loading timed out. Please try again later.';
          });
        }
      });
    }
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    if (_isGlbModel && _isModelLoaded) {
      // Debounce zoom updates
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 10), () {
        if (mounted) {
          // Handle zoom
          final newZoom = (_currentZoom / details.scale).clamp(
            _minZoom,
            _maxZoom,
          );
          if (newZoom != _currentZoom) {
            setState(() {
              _currentZoom = newZoom;
            });

            // Safe access to the GLB viewer
            try {
              final viewerState = _glbViewerKey.currentState;
              if (viewerState != null) {
                viewerState.setZoom(_currentZoom);
              }
            } catch (error) {
              // Silent catch - don't crash the UI for rendering issues
              debugPrint('Error setting zoom: $error');
            }
          }
        }
      });
    }
  }

  void _handleModelLoadState(bool isLoaded) {
    if (mounted) {
      // Cancel timeout if model loaded successfully
      if (isLoaded) {
        _loadingTimeout?.cancel();
      }

      setState(() {
        _isModelLoaded = isLoaded;
        _isLoading = !isLoaded;
      });
    }
  }

  Widget _buildLoadingIndicator() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              "assets/lotties/loading_model.json",
              width: 200,
              height: 200,
            ),
            const Text(
              "Loading 3D Model...",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlPanel() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(Icons.zoom_in, _zoomIn),
              const SizedBox(width: 8),
              _buildIconButton(Icons.zoom_out, _zoomOut),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(Icons.rotate_left, _rotateLeft),
              const SizedBox(width: 8),
              _buildIconButton(Icons.rotate_right, _rotateRight),
            ],
          ),
          const SizedBox(height: 8),
          _buildIconButton(Icons.refresh, _resetCamera),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, [VoidCallback? action]) {
    return FloatingActionButton(
      heroTag: icon.codePoint.toString(),
      mini: true,
      backgroundColor: Colors.black87,
      onPressed: action,
      child: Icon(icon, color: Colors.white),
    );
  }

  void _zoomIn() {
    setState(() {
      _currentZoom = (_currentZoom - 1.0).clamp(_minZoom, _maxZoom);
    });
    _safelySetZoom(_currentZoom);
  }

  void _zoomOut() {
    setState(() {
      _currentZoom = (_currentZoom + 1.0).clamp(_minZoom, _maxZoom);
    });
    _safelySetZoom(_currentZoom);
  }

  void _safelySetZoom(double zoom) {
    try {
      final viewerState = _glbViewerKey.currentState;
      if (viewerState != null) {
        viewerState.setZoom(zoom);
      }
    } catch (error) {
      debugPrint('Error setting zoom: $error');
    }
  }

  void _rotateLeft() {
    setState(() {
      _rotationX -= 15;
    });
    _safelyRotateModel();
  }

  void _rotateRight() {
    setState(() {
      _rotationX += 15;
    });
    _safelyRotateModel();
  }

  void _safelyRotateModel() {
    try {
      final viewerState = _glbViewerKey.currentState;
      if (viewerState != null) {
        viewerState.rotateModel(_rotationX, _rotationY);
      }
    } catch (error) {
      debugPrint('Error rotating model: $error');
    }
  }

  void _resetCamera() {
    setState(() {
      _currentZoom = 5.0;
      _rotationX = 0.0;
      _rotationY = 0.0;
    });

    try {
      final viewerState = _glbViewerKey.currentState;
      if (viewerState != null) {
        viewerState.resetCameraOrbit();
      }
    } catch (error) {
      debugPrint('Error resetting camera: $error');
    }
  }
}
