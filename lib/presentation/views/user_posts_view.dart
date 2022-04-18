import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/post.dart';
import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/post/post_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user/user_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_posts/user_posts_bloc.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/post_item.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPostsView extends StatelessWidget {
  final PostRepository postRepository;
  final User user;
  const UserPostsView(
      {Key? key, required this.postRepository, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Posts ${user.name!}',
              leadingIcon: Icons.arrow_back,
              flex: 2,
              padding: 30.0,
              leadingOnTap: () {
                Navigator.pop(context);
              },
              rightIcon: Icons.account_circle_outlined),
          preferredSize: const Size.fromHeight(120)),
      body: BlocBuilder<UserPostsCubit, UserPostsState>(
        builder: (context, state) {
          if (state is InitUserPostsState || state is LoadingUserPostsState) {
            return const ProgressIndicate();
          }
          if (state is LoadedUserPostsState) {
            final posts = state.posts;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Post post = posts[index];
                return PostUserItem(post, onTap: () async {
                  User user = await BlocProvider.of<UserPostsCubit>(context)
                      .getUser(post.userId);
                  pushNavigator(context, PostContainer(post, user));
                }, index: index+1,);
              },
              itemCount: posts.length,
            );
          }
          if (state is ErrorUserPostsState) {
            return FailureDialog(state.message);
          }
          return const FailureDialog('Erro Desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person),
        onPressed: () async {
          pushNavigator(context, UserContainer(user));
        },
      ),
    );
  }
}
