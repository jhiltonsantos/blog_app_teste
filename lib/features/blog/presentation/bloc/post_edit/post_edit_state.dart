import 'package:flutter/material.dart';

@immutable
abstract class PostEditState {
  const PostEditState();
}

@immutable
class ShowPostEditState extends PostEditState {
  const ShowPostEditState();
}

@immutable
class SendingPostEditState extends PostEditState {
  const SendingPostEditState();
}

@immutable
class SentPostEditState extends PostEditState {
  const SentPostEditState();
}

@immutable
class ErrorPostEditState extends PostEditState {
  final String message;

  const ErrorPostEditState(this.message);
}