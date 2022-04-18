import 'dart:io';

import 'package:blog_teste_tecnico/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@immutable
abstract class PhotoFormState {
  const PhotoFormState();
}

@immutable
class ShowPhotoFormState extends PhotoFormState {
  const ShowPhotoFormState();
}

@immutable
class SendingPhotoFormState extends PhotoFormState {
  const SendingPhotoFormState();
}

@immutable
class SentPhotoFormState extends PhotoFormState {
  const SentPhotoFormState();
}

@immutable
class ErrorPhotoFormState extends PhotoFormState {
  final String message;

  const ErrorPhotoFormState(this.message);
}

class PhotoFormCubit extends Cubit<PhotoFormState> {
  PhotoFormCubit() : super(const ShowPhotoFormState());


  void save(Photo photoCreated, BuildContext context) async {
    emit(const SendingPhotoFormState());
    await _send(photoCreated, context);
  }

  _send(Photo photo, BuildContext context) async {
    await PhotoRepository().savePhoto(photo).then((_) =>
        emit(const SentPhotoFormState())).catchError((error) {
      emit(ErrorPhotoFormState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorPhotoFormState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorPhotoFormState(error.message));
    });
  }
}
