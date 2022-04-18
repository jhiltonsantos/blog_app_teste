import 'dart:io';

import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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

class UserEditCubit extends Cubit<UserEditState> {
  UserEditCubit() : super(const ShowUserEditState());


  void save(int id, User user, BuildContext context) async {
    emit(const SendingUserEditState());
    await _send(id, user, context);
  }
  final UserRepository _userRepository = UserRepository();

  _send(int id, User user, BuildContext context) async {
    await _userRepository.updateUser(id, user).then((_) =>
        emit(const SentUserEditState())).catchError((error) {
      emit(ErrorUserEditState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorUserEditState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorUserEditState(error.message));
    });
  }
}
