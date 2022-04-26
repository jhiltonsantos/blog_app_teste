import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post_form/post_form_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post_form/post_form_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/label_form_item.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostFormPage extends StatelessWidget {
  final User userPost;

  const PostFormPage({Key? key, required this.userPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostFormCubit, PostFormState>(builder: (context, state) {
      if (state is ShowPostFormState) {
        return _NewPostView(user: userPost);
      }
      if (state is SendingPostFormState || state is SentPostFormState) {
        return const ProgressPage();
      }
      if (state is ErrorPostFormState) {
        return FailureDialog(state.message);
      }
      return const FailureDialog('Erro Desconhecido');
    });
  }
}

class _NewPostView extends StatelessWidget {
  final User user;

  _NewPostView({Key? key, required this.user}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Novo Post',
              leadingIcon: Icons.arrow_back,
              leadingOnTap: () {
                Navigator.pop(context);
              },
              rightIcon: Icons.account_circle_outlined),
          preferredSize: const Size.fromHeight(120)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  user.name!,
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              const LabelFormItem(title: 'Titulo: '),
              TextFieldItem(controller: _titleController),
              const LabelFormItem(title: 'Mensagem: '),
              TextFieldItem(controller: _bodyController),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Postar'),
                    onPressed: () {
                      final String title = _titleController.text;
                      final String body = _bodyController.text;
                      if (title.isEmpty || body.isEmpty) {
                        const ErrorPostFormState('Faltam dados');
                      } else {
                        final postCreated = Post(1, 101, title, body);
                        BlocProvider.of<PostFormCubit>(context)
                            .save(postCreated, context);
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
