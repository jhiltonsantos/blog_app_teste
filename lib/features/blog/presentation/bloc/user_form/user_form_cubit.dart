import 'dart:io';

import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_form/user_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




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
