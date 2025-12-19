import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class GlbModelViewer extends StatefulWidget {
  const GlbModelViewer({
    super.key,
    required this.modelPath,
    required this.onLoadStateChanged,
  });

  final String modelPath;
  final void Function(bool isLoaded) onLoadStateChanged;

  @override
  State<GlbModelViewer> createState() => GlbModelViewerState();
}

class GlbModelViewerState extends State<GlbModelViewer> {
  Flutter3DController? _controller;
  bool _isModelLoaded = false;
  bool _hasNotifiedLoaded = false;
  double _currentZoom = 5.0;
  double _orbitX = 0.0;
  double _orbitY = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller = Flutter3DController();
    _controller?.onModelLoaded.addListener(_handleModelLoaded);

    // Shorter timeout as a fallback only
    Future.delayed(const Duration(seconds: 5), () {
      _notifyLoadedIfNeeded();
    });
  }

  void _notifyLoadedIfNeeded() {
    if (mounted && !_hasNotifiedLoaded) {
      _hasNotifiedLoaded = true;
      setState(() => _isModelLoaded = true);
      widget.onLoadStateChanged(true);
    }
  }

  void disposeController() {
    _controller?.onModelLoaded.removeListener(_handleModelLoaded);
    _controller?.onModelLoaded.dispose();
    _controller = null;
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }

  void _handleModelLoaded() {
    if (_controller?.onModelLoaded.value == true) {
      _notifyLoadedIfNeeded();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flutter3DViewer(
      controller: _controller,
      src: widget.modelPath,
      progressBarColor: Colors.transparent,
      activeGestureInterceptor: true,
      enableTouch: true,
      onProgress: (progress) {
        // Consider model loaded when progress is significant
        if (progress > 0.8 && !_hasNotifiedLoaded) {
          _notifyLoadedIfNeeded();
        }
      },
      onLoad: (model) {
        _controller?.playAnimation();
        _notifyLoadedIfNeeded();
      },
      onError: (error) {
        debugPrint('Error loading 3D model: $error');
        // Even on error, we should show the UI rather than an infinite loading state
        _notifyLoadedIfNeeded();
      },
    );
  }

  void setCameraOrbit(double x, double y, double z) {
    try {
      _controller?.setCameraOrbit(x, y, z);
    } catch (e) {
      debugPrint('Error setting camera orbit: $e');
    }
  }

  void setZoom(double zoom) {
    try {
      _currentZoom = zoom;
      // Apply zoom while preserving rotation
      _controller?.setCameraOrbit(_orbitX, _orbitY, zoom);
    } catch (e) {
      debugPrint('Error setting zoom: $e');
    }
  }

  void rotateModel(double x, double y) {
    try {
      _orbitX = x;
      _orbitY = y;
      _controller?.setCameraOrbit(x, y, _currentZoom);
    } catch (e) {
      debugPrint('Error rotating model: $e');
    }
  }

  void resetCameraOrbit() {
    try {
      _orbitX = 0.0;
      _orbitY = 0.0;
      _currentZoom = 5.0;
      _controller?.resetCameraOrbit();
    } catch (e) {
      debugPrint('Error resetting camera: $e');
    }
  }
}
