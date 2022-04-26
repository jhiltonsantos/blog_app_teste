import 'package:flutter/material.dart';

@immutable
abstract class UserFormState {
  const UserFormState();
}

@immutable
class ShowUserFormState extends UserFormState {
  const ShowUserFormState();
}

@immutable
class SendingUserFormState extends UserFormState {
  const SendingUserFormState();
}

@immutable
class SentUserFormState extends UserFormState {
  const SentUserFormState();
}

@immutable
class ErrorUserFormState extends UserFormState {
  final String message;

  const ErrorUserFormState(this.message);
}