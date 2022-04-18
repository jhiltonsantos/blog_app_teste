import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/domain/post.dart';
import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class PostsListCubit extends Cubit<PostsListState> {
  PostsListCubit() : super(const InitPostsListState());

  void reloadList(PostRepository post) async {
    emit(const LoadingPostsListState());
    post.findAllPosts().then((posts) => emit(LoadedPostsListState(posts)));
  }
  final UserRepository _userRepository = UserRepository();

  Future<User> getUser(int userId) async {
    return await _userRepository.findUserByID(userId);
  }
}