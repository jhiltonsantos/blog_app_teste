import 'dart:io';

import 'package:blog_teste_tecnico/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@immutable
abstract class PhotoEditState {
  const PhotoEditState();
}

@immutable
class ShowPhotoEditState extends PhotoEditState {
  const ShowPhotoEditState();
}

@immutable
class SendingPhotoEditState extends PhotoEditState {
  const SendingPhotoEditState();
}

@immutable
class SentPhotoEditState extends PhotoEditState {
  const SentPhotoEditState();
}

@immutable
class ErrorPhotoEditState extends PhotoEditState {
  final String message;

  const ErrorPhotoEditState(this.message);
}

class PhotoEditCubit extends Cubit<PhotoEditState> {
  PhotoEditCubit() : super(const ShowPhotoEditState());

  final PhotoRepository _photoRepository = PhotoRepository();

  void update(int id, Photo photo, BuildContext context) async {
    emit(const SendingPhotoEditState());
    await _send(id, photo, context);
  }

  _send(int id, Photo photo, BuildContext context) async {
    await _photoRepository.updatePhoto(id, photo).then((_) =>
        emit(const SentPhotoEditState())).catchError((error) {
      emit(ErrorPhotoEditState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorPhotoEditState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorPhotoEditState(error.message));
    });
  }
}
