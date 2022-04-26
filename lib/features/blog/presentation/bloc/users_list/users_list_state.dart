import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:flutter/material.dart';

abstract class UsersListState {
  const UsersListState();
}

@immutable
class InitUsersListState extends UsersListState {
  const InitUsersListState();
}

@immutable
class LoadingUsersListState extends UsersListState {
  const LoadingUsersListState([List<User>? user]);
}

@immutable
class LoadedUsersListState extends UsersListState {
  final List<User> users;
  const LoadedUsersListState(this.users);
}

@immutable
class ErrorUsersListState extends UsersListState {
  final String message;

  const ErrorUsersListState(this.message);
}