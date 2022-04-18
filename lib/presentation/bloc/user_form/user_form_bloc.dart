import 'dart:io';

import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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

class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit() : super(const ShowUserFormState());


  void save(User userCreated, BuildContext context) async {
    emit(const SendingUserFormState());
    await _send(userCreated, context);
  }

  _send(User user, BuildContext context) async {
    await UserRepository().saveUser(user).then((_) =>
        emit(const SentUserFormState())).catchError((error) {
      emit(ErrorUserFormState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorUserFormState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorUserFormState(error.message));
    });
  }
}
