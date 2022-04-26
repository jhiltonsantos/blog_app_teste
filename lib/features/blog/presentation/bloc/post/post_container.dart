import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post/post_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post/post_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_container.dart';

class PostContainer extends BlocContainer {
  final Post post;
  final User user;

  const PostContainer(this.post, this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit(post: post, user: user),
      child: BlocListener<PostCubit, PostState>(
        listener: (context, state) {
          if (state is SentDeletePostState) {
            showSuccessfulDialog(context, 'Post Deletado');
          }
        },
        child: const PostPage(),
      ),
    );
  }
}

