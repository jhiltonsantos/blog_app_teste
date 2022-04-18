import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_edit/user_edit_bloc.dart';
import 'package:blog_teste_tecnico/presentation/views/user_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserEditContainer extends BlocContainer {
  final User user;

  const UserEditContainer({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserEditCubit>(
      create: (BuildContext context) {
        return UserEditCubit();
      },
      child: BlocListener<UserEditCubit, UserEditState>(
        listener: (context, state) {
          if (state is SentUserEditState) {
            showSuccessfulDialog(context, 'Usuário Atualizado');
          }
        },
        child: UserEditView(user: user),
      ),
    );
  }
}

