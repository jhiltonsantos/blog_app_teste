import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/users_list/users_list_cubit.dart';
import 'package:blog_teste_tecnico/presentation/pages/users_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
