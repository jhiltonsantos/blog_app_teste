import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post/post_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post/post_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/post_edit/post_edit_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_posts/user_posts_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/theme/colors_components.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/button_options.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/progress_indicate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is InitPostState) {
          return _ViewPost(post: state.post, user: state.user);
        }
        if (state is LoadingPostState || state is SentDeletePostState) {
          return const ProgressPage();
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
                    ButtonOptionsWidget(
                      text: 'Editar',
                      colorButton: Colors.black,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  PostEditContainer(user: user, post: post)),
                        );
                      },
                    ),
                    ButtonOptionsWidget(
                      text: 'Deletar',
                      colorButton: floatActionButtonColor,
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
