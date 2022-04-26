import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post_edit/post_edit_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post_edit/post_edit_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/post_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditContainer extends BlocContainer {
  final User user;
  final Post post;

  const PostEditContainer({Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostEditCubit>(
      create: (BuildContext context) {
        return PostEditCubit();
      },
      child: BlocListener<PostEditCubit, PostEditState>(
        listener: (context, state) {
          if (state is SentPostEditState) {
            showSuccessfulDialog(context, 'Post editado com sucesso');
          }
        },
        child: PostEditPage(userPost: user, post: post),
      ),
    );
  }
}

