import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/domain/post.dart';
import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:blog_teste_tecnico/presentation/components/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/post_item.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post/post_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post_form/post_form_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/posts_list/posts_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsListView extends StatelessWidget {
  final PostRepository post;

  const PostsListView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Posts',
              leadingIcon: Icons.arrow_back,
              leadingOnTap: () {
                Navigator.pop(context);
              },
              rightIcon: Icons.account_circle_outlined),
          preferredSize: const Size.fromHeight(120)),
      body: BlocBuilder<PostsListCubit, PostsListState>(
        builder: (context, state) {
          if (state is InitPostsListState || state is LoadingPostsListState) {
            return const ProgressIndicate();
          }
          if (state is LoadedPostsListState) {
            final posts = state.posts;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Post post = posts[index];
                return PostItem(
                  post,
                  onTap: () async {
                    User user = await BlocProvider.of<PostsListCubit>(context)
                        .getUser(post.userId);
                    pushNavigator(context, PostContainer(post, user));
                  },
                );
              },
              itemCount: posts.length,
            );
          }
          if (state is ErrorPostsListState) {
            return FailureDialog(state.message);
          }
          return const Center(
            child: Text(
              'Erro Desconhecido',
              style: TextStyle(fontSize: 42.0),
            ),
          );
        },
      ),
      // TODO: Alterar para receber um usuario real
      floatingActionButton: buildAddPostButton(context, 1),
    );
  }

  FloatingActionButton buildAddPostButton(BuildContext context, int idUser) {
    return FloatingActionButton(
        child: const Icon(Icons.post_add),
        onPressed: () async {
          User user = await BlocProvider.of<PostsListCubit>(context)
              .getUser(idUser);
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostFormContainer(user: user)),
          );
          context.read<PostsListCubit>().reloadList(post);
        });
  }
}
