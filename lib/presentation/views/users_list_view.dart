import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_posts/user_posts_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/user_item.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_form/user_form_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/users_list/users_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListView extends StatelessWidget {
  final UserRepository user;

  const UsersListView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Usuários',
              leadingIcon: Icons.arrow_back,
              leadingOnTap: () {
                Navigator.pop(context);
              },
              rightIcon: Icons.account_circle_outlined),
          preferredSize: const Size.fromHeight(120)),
      body: BlocBuilder<UsersListCubit, UsersListState>(
        builder: (context, state) {
          if (state is InitUsersListState || state is LoadingUsersListState) {
            return const ProgressIndicate();
          }
          if (state is LoadedUsersListState) {
            final users = state.users;
            return ListView.builder(
              itemBuilder: (context, index) {
                final User user = users[index];
                return UserItem(
                    onTap: () async {
                      pushNavigator(context, UserPostsContainer(user: user));
                    },
                    user: user);
              },
              itemCount: users.length,
            );
          }
          if (state is ErrorUsersListState) {
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
      floatingActionButton: buildAddUserButton(context),
    );
  }

  FloatingActionButton buildAddUserButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        pushNavigator(context, const UserFormContainer());
        context.read<UsersListCubit>().reloadList(user);
      },
      child: const Icon(Icons.person_add),
    );
  }
}
