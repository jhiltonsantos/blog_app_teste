import 'package:blog_teste_tecnico/domain/entities/post.dart';
import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post_edit/post_edit_bloc.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user/user_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/label_form.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditView extends StatelessWidget {
  final User userPost;
  final Post post;

  const PostEditView({Key? key, required this.userPost, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEditCubit, PostEditState>(builder: (context, state) {
      if (state is ShowPostEditState) {
        return _NewPostView(user: userPost, post: post);
      }
      if (state is SendingPostEditState || state is SentPostEditState) {
        return const ProgressView();
      }
      if (state is ErrorPostEditState) {
        return FailureDialog(state.message);
      }
      return const FailureDialog('Erro Desconhecido');
    });
  }
}

class _NewPostView extends StatelessWidget {
  final User user;
  final Post post;

  _NewPostView({Key? key, required this.user, required this.post})
      : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = post.title;
    _bodyController.text = post.body;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Atualizar Post',
              leadingIcon: Icons.arrow_back,
              leadingOnTap: () {
                Navigator.pop(context);
              },
              rightIcon: Icons.account_circle_outlined),
          preferredSize: const Size.fromHeight(120)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      pushNavigator(context, UserContainer(user));
                    },
                    child: Text(user.name!,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              labelForm('Titulo: ', Colors.black),
              textFieldItem(_titleController),
              labelForm('Mensagem: ', Colors.black),
              textFieldItem(_bodyController),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Atualizar'),
                    onPressed: () {
                      final String title = _titleController.text;
                      final String body = _bodyController.text;
                      if (title.isEmpty ||
                          body.isEmpty ||
                          (title == post.title && body == post.body)) {
                        const ErrorPostEditState('Faltam dados');
                      } else {
                        final postUpdated = Post(1, 101, title, body);
                        BlocProvider.of<PostEditCubit>(context)
                            .save(post.id, postUpdated, context);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
