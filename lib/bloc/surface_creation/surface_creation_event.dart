part of 'surface_creation_bloc.dart';

@immutable
sealed class SurfaceCreationEvent {}

class SurfaceCreationSetPanAndZoomEvent extends SurfaceCreationEvent {
  final double panX;
  final double panY;
  final double zoom;
  final List<String> slotsVisibleInUserWidget;
  SurfaceCreationSetPanAndZoomEvent(
      {required this.panX, required this.panY, required this.zoom, required this.slotsVisibleInUserWidget});
}


