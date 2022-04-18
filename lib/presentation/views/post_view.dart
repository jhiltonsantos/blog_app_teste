import 'package:blog_teste_tecnico/domain/post.dart';
import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user/user_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_posts/user_posts_container.dart';
import 'package:blog_teste_tecnico/presentation/components/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/button_options.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post/post_bloc.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post_edit/post_edit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);
  // TODO: AO CLICAR NO NOME DO USUARIO MOSTRAR O PERFIL DELE
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is InitPostState) {
          return _ViewPost(post: state.post, user: state.user);
        }
        if (state is LoadingPostState || state is SentDeletePostState) {
          return const ProgressView();
        }
        if (state is ErrorPostState) {
          return FailureDialog(state.message);
        }
        return const FailureDialog('Erro Desconhecido');
      },
    );
  }
}

class _ViewPost extends StatelessWidget {
  final Post post;
  final User user;

  const _ViewPost({Key? key, required this.post, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Post ${post.id}',
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
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      pushNavigator(context, UserPostsContainer(user: user));
                    },
                    child: Text(user.name!,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Center(
                  child: Text(
                post.title,
                style: const TextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 10.0),
                child: Text(
                  post.body,
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButtonOptions(
                      text: 'Editar',
                      colorButton: Colors.blue,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  PostEditContainer(user: user, post: post)),
                        );
                      },
                    ),
                    buildButtonOptions(
                      text: 'Deletar',
                      colorButton: Colors.redAccent,
                      onTap: () {
                        BlocProvider.of<PostCubit>(context)
                            .delete(post.id, context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
