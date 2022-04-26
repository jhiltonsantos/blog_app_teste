import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/posts_list/posts_list_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/posts_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_container.dart';

class PostsListContainer extends BlocContainer {
  const PostsListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostRepository post = PostRepository();
    return BlocProvider<PostsListCubit>(
      child: PostsListPage(post: post),
      create: (BuildContext context) {
        final cubit = PostsListCubit();
        cubit.reloadList(post);
        return cubit;
      },
    );
  }
}
