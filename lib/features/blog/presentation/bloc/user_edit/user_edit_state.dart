
import 'package:flutter/material.dart';

@immutable
abstract class UserEditState {
  const UserEditState();
}

@immutable
class ShowUserEditState extends UserEditState {
  const ShowUserEditState();
}

@immutable
class SendingUserEditState extends UserEditState {
  const SendingUserEditState();
}

@immutable
class SentUserEditState extends UserEditState {
  const SentUserEditState();
}

@immutable
class ErrorUserEditState extends UserEditState {
  final String message;

  const ErrorUserEditState(this.message);
}