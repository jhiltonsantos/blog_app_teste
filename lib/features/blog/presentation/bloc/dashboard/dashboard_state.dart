import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:flutter/material.dart';

abstract class DashboardState {
  const DashboardState();

  List<Object> get props => [];
}

@immutable
class InitDashboardState extends DashboardState {
  const InitDashboardState();
}

@immutable
class LoadingDashboardState extends DashboardState {
  const LoadingDashboardState([List<Photo>? photo]);
}

@immutable
class LoadedDashboardState extends DashboardState {
  final List<Photo> photos;
  const LoadedDashboardState(this.photos);

  @override
  List<Object> get props => [photos];
}

@immutable
class ErrorDashboardState extends DashboardState {
  final String message;

  const ErrorDashboardState(this.message);

  @override
  List<Object> get props => [message];
}
