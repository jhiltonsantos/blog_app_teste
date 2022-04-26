import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user/user_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user/user_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_container.dart';

class UserContainer extends BlocContainer {
  final User user;

  const UserContainer(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(user: user),
      child: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SentDeleteUserState) {
            showSuccessfulDialog(context, 'Usuario Deletado');
          }
        },
        child: const UserPage(),
      ),
    );
  }
}
