import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_posts/user_posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
