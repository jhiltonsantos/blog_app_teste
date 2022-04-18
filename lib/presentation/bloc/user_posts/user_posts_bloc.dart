import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/domain/post.dart';
import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class UserPostsCubit extends Cubit<UserPostsState> {
  UserPostsCubit() : super(const InitUserPostsState());

  void reloadList({required PostRepository post, required int userId}) async {
    emit(const LoadingUserPostsState());
    post
        .findAllPostsByUser(userId)
        .then((posts) => emit(LoadedUserPostsState(posts)));
  }

  final UserRepository _userRepository = UserRepository();

  Future<User> getUser(int userId) async {
    return await _userRepository.findUserByID(userId);
  }
}
