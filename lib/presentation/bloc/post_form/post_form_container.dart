import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post_form/post_form_bloc.dart';
import 'package:blog_teste_tecnico/presentation/views/post_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostFormContainer extends BlocContainer {
  final User user;

  const PostFormContainer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostFormCubit>(
      create: (BuildContext context) {
        return PostFormCubit();
      },
      child: BlocListener<PostFormCubit, PostFormState>(
        listener: (context, state) {
          if (state is SentPostFormState) {
            showSuccessfulDialog(context, 'Post Criado');
          }
        },
        child: PostFormView(userPost: user),
      ),
    );
  }
}
