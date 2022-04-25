import 'package:blog_teste_tecnico/domain/entities/post.dart';
import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:flutter/material.dart';

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