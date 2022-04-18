import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/presentation/components/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/users_list/users_list_bloc.dart';
import 'package:blog_teste_tecnico/presentation/views/users_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListContainer extends BlocContainer {
  const UsersListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserRepository user = UserRepository();
    return BlocProvider<UsersListCubit>(
      child: UsersListView(user: user),
      create: (BuildContext context) {
        final cubit = UsersListCubit();
        cubit.reloadList(user);
        return cubit;
      },
    );
  }
}
