import 'dart:io';

import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post_form/post_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PostFormCubit extends Cubit<PostFormState> {
  PostFormCubit() : super(const ShowPostFormState());

  final PostRepository _postRepository = PostRepository();

  void save(Post postCreated, BuildContext context) async {
    emit(const SendingPostFormState());
    await _send(postCreated, context);
  }

  _send(Post post, BuildContext context) async {
    await _postRepository.savePost(post).then((_) =>
        emit(const SentPostFormState())).catchError((error) {
      emit(ErrorPostFormState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorPostFormState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorPostFormState(error.message));
    });
  }
}
