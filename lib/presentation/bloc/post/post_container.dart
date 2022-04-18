import 'package:blog_teste_tecnico/domain/post.dart';
import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:blog_teste_tecnico/presentation/components/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post/post_bloc.dart';
import 'package:blog_teste_tecnico/presentation/views/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: const PostView(),
      ),
    );
  }
}

