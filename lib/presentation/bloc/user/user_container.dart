import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user/user_bloc.dart';
import 'package:blog_teste_tecnico/presentation/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: const UserView(),
      ),
    );
  }
}
