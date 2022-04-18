import 'dart:io';

import 'package:blog_teste_tecnico/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/domain/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PhotoState {
  const PhotoState();
}

@immutable
class InitPhotoState extends PhotoState {
  final Photo photo;

  const InitPhotoState({required this.photo});
}

@immutable
class LoadingPhotoState extends PhotoState {
  const LoadingPhotoState();
}

@immutable
class SentDeletePhotoState extends PhotoState {
  const SentDeletePhotoState();
}

@immutable
class ErrorPhotoState extends PhotoState {
  final String message;

  const ErrorPhotoState(this.message);
}

class PhotoCubit extends Cubit<PhotoState> {
  final Photo photo;

  PhotoCubit({required this.photo}) : super(InitPhotoState(photo: photo));

  final PhotoRepository _photoRepository = PhotoRepository();

  void delete(int id, BuildContext context) async {
    emit(const LoadingPhotoState());
    await _send(id, context);
  }

  _send(int id, BuildContext context) async {
    await _photoRepository.deletePhoto(id).then((_) {
      return emit(const SentDeletePhotoState());
    }).catchError((error) {
      emit(ErrorPhotoState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorPhotoState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorPhotoState(error.message));
    });
  }
}
