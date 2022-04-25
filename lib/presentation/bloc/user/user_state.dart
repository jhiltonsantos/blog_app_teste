import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:flutter/material.dart';

abstract class UserState {
  const UserState();
}

@immutable
class InitUserState extends UserState {
  final User user;

  const InitUserState({required this.user});
}

@immutable
class LoadingUserState extends UserState {
  const LoadingUserState();
}

@immutable
class SentDeleteUserState extends UserState {
  const SentDeleteUserState();
}

@immutable
class ErrorUserState extends UserState {
  final String message;

  const ErrorUserState(this.message);
}