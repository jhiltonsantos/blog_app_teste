import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/posts_list/posts_list_cubit.dart';
import 'package:blog_teste_tecnico/presentation/pages/posts_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
