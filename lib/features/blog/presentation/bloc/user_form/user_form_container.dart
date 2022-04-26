import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_form/user_form_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_form/user_form_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/user_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_container.dart';

class UserFormContainer extends BlocContainer {

  const UserFormContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserFormCubit>(
      create: (BuildContext context) {
        return UserFormCubit();
      },
      child: BlocListener<UserFormCubit, UserFormState>(
        listener: (context, state) {
          if (state is SentUserFormState) {
            showSuccessfulDialog(context, 'Usuário Criado');
          }
        },
        child: const UserFormPage(),
      ),
    );
  }
}
