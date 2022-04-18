import 'package:blog_teste_tecnico/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DashboardState {
  const DashboardState();
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
}

@immutable
class ErrorDashboardState extends DashboardState {
  final String message;

  const ErrorDashboardState(this.message);
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const InitDashboardState());

  void reloadList(PhotoRepository photo) async {
    emit(const LoadingDashboardState());
    photo.findAllPhotos().then((photos) => emit(LoadedDashboardState(photos)));
  }




}