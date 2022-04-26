import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:flutter/material.dart';

abstract class PostsListState {
  const PostsListState();
}

@immutable
class InitPostsListState extends PostsListState {
  const InitPostsListState();
}

@immutable
class LoadingPostsListState extends PostsListState {
  const LoadingPostsListState([List<Post>? post]);
}

@immutable
class LoadedPostsListState extends PostsListState {
  final List<Post> posts;
  const LoadedPostsListState(this.posts);
}

@immutable
class ErrorPostsListState extends PostsListState {
  final String message;

  const ErrorPostsListState(this.message);
}