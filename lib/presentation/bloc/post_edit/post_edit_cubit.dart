import 'dart:io';

import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/post.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post_edit/post_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostEditCubit extends Cubit<PostEditState> {
  PostEditCubit() : super(const ShowPostEditState());

  final PostRepository _postRepository = PostRepository();

  void save(int id, Post post, BuildContext context) async {
    emit(const SendingPostEditState());
    await _send(id, post, context);
  }

  _send(int id, Post post, BuildContext context) async {
    await _postRepository.updatePost(id, post).then((_) =>
        emit(const SentPostEditState())).catchError((error) {
      emit(ErrorPostEditState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorPostEditState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorPostEditState(error.message));
    });
  }
}
