import 'dart:io';

import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class UserCubit extends Cubit<UserState> {
  final User user;

  UserCubit({required this.user}) : super(InitUserState(user: user));

  void deleteUser(BuildContext context, int id) async {
    emit(const LoadingUserState());
    await _sendUser(context, id);
  }

  _sendUser(BuildContext context, int id) async {
    await UserRepository()
        .deleteUser(id)
        .then((_) => emit(const SentDeleteUserState()))
        .catchError((e) => emit(ErrorUserState(e.message)),
            test: (e) => e is HttpException)
        .catchError(
            (e) => emit(const ErrorUserState('Tempo Excedido na Execução')),
            test: (e) => e is SocketException)
        .catchError((e) => emit(ErrorUserState(e.message)));
  }
}
