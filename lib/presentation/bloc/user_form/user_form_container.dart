import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_form/user_form_bloc.dart';
import 'package:blog_teste_tecnico/presentation/views/user_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: const UserFormView(),
      ),
    );
  }
}
