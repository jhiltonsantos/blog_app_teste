import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:flutter/material.dart';

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