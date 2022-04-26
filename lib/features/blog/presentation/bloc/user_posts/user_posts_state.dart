import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:flutter/material.dart';

abstract class UserPostsState {
  const UserPostsState();
}

@immutable
class InitUserPostsState extends UserPostsState {
  const InitUserPostsState();
}

@immutable
class LoadingUserPostsState extends UserPostsState {
  const LoadingUserPostsState([List<Post>? post]);
}

@immutable
class LoadedUserPostsState extends UserPostsState {
  final List<Post> posts;
  const LoadedUserPostsState(this.posts);
}

@immutable
class ErrorUserPostsState extends UserPostsState {
  final String message;

  const ErrorUserPostsState(this.message);
}