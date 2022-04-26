import 'package:flutter/material.dart';

@immutable
abstract class PostFormState {
  const PostFormState();
}

@immutable
class ShowPostFormState extends PostFormState {
  const ShowPostFormState();
}

@immutable
class SendingPostFormState extends PostFormState {
  const SendingPostFormState();
}

@immutable
class SentPostFormState extends PostFormState {
  const SentPostFormState();
}

@immutable
class ErrorPostFormState extends PostFormState {
  final String message;

  const ErrorPostFormState(this.message);
}
