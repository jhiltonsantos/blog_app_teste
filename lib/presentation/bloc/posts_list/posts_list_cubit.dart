import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/posts_list/post_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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