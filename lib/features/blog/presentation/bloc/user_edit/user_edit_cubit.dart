import 'dart:io';

import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_edit/user_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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
