import 'dart:io';

import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/post.dart';
import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PostState {
  const PostState();
}

@immutable
class InitPostState extends PostState {
  final Post post;
  final User user;

  const InitPostState({required this.post, required this.user});
}

@immutable
class LoadingPostState extends PostState {
  const LoadingPostState();
}


@immutable
class SentDeletePostState extends PostState {
  const SentDeletePostState();
}

@immutable
class ErrorPostState extends PostState {
  final String message;

  const ErrorPostState(this.message);
}

class PostCubit extends Cubit<PostState> {
  final Post post;
  final User user;

  PostCubit({required this.post, required this.user})
      : super(InitPostState(post: post, user: user));

  final PostRepository _postRepository = PostRepository();

  void delete(int id, BuildContext context) async {
    emit(const LoadingPostState());
    await _send(id, context);
  }

  _send(int id, BuildContext context) async {
    await _postRepository.deletePost(id).then((_) {

      return emit(const SentDeletePostState());
    }).catchError((error) {
      emit(ErrorPostState(error.message));
    }, test: (error) => error is HttpException).catchError((error) {
      emit(const ErrorPostState('Tempo Excedido na Execução'));
    }, test: (error) => error is SocketException).catchError((error) {
      emit(ErrorPostState(error.message));
    });
  }
}
