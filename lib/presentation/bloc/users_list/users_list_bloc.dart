import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class UsersListCubit extends Cubit<UsersListState> {
  UsersListCubit() : super(const InitUsersListState());

  void reloadList(UserRepository user) async {
    emit(const LoadingUsersListState());
    user.findAllUser().then((users) => emit(LoadedUsersListState(users)));
  }

}