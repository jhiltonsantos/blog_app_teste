import 'package:flutter/material.dart';

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