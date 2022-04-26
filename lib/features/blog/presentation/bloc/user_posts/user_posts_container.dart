import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_posts/user_posts_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/user_posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_container.dart';

class UserPostsContainer extends BlocContainer {
  final User user;
  const UserPostsContainer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostRepository post = PostRepository();
    return BlocProvider<UserPostsCubit>(
      child: UserPostsPage(
        postRepository: post,
        user: user,
      ),
      create: (BuildContext context) {
        final cubit = UserPostsCubit();
        cubit.reloadList(userId: user.id!, post: post);
        return cubit;
      },
    );
  }
}
