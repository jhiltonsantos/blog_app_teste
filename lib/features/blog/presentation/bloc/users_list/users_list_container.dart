import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/users_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_container.dart';
import 'users_list_cubit.dart';

class UsersListContainer extends BlocContainer {
  const UsersListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserRepository user = UserRepository();
    return BlocProvider<UsersListCubit>(
      child: UsersListPage(user: user),
      create: (BuildContext context) {
        final cubit = UsersListCubit();
        cubit.reloadList(user);
        return cubit;
      },
    );
  }
}
