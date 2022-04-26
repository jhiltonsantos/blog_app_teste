import 'package:flutter/material.dart';

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