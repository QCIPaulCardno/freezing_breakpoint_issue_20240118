part of 'surface_creation_bloc.dart';

@immutable
sealed class SurfaceCreationState {}

final class SurfaceCreationInitial extends SurfaceCreationState {}

final class SurfaceCreationUpdateImageState extends SurfaceCreationState {
  SurfaceCreationUpdateImageState();
}
