import 'dart:io';

import 'package:blog_teste_tecnico/features/blog/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/photo_form/photo_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoFormCubit extends Cubit<PhotoFormState> {
  PhotoFormCubit() : super(const ShowPhotoFormState());

  void save(Photo photoCreated, BuildContext context) async {
    emit(const SendingPhotoFormState());
    await _send(photoCreated, context);
  }

  _send(Photo photo, BuildContext context) async {
    await PhotoRepository()
        .savePhoto(photo)
        .then((_) => emit(const SentPhotoFormState()))
        .catchError((error) {
      emit(ErrorPhotoFormState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorPhotoFormState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorPhotoFormState(error.message));
    });
  }
}
