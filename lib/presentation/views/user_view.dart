import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:blog_teste_tecnico/presentation/components/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/button_options.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/label_form.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/label_form_item.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user/user_bloc.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_edit/user_edit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is InitUserState) {
        return _ViewUser(user: state.user);
      }
      if (state is LoadingUserState || state is SentDeleteUserState) {
        return const ProgressView();
      }
      if (state is ErrorUserState) {
        return FailureDialog(state.message);
      }
      return const FailureDialog('Erro Desconhecido');
    });
  }
}

class _ViewUser extends StatelessWidget {
  final User user;

  // TODO: AO CLICAR NO USUARIO MOSTRAR TODOS OS POST DELE
  const _ViewUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: user.name!,
              leadingIcon: Icons.arrow_back,
              leadingOnTap: () {
                Navigator.pop(context);
              },
              rightIcon: Icons.account_circle_outlined),
          preferredSize: const Size.fromHeight(120)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              labelFormItem('Nome de Usuario'),
              buildDataUser(user.username!),
              labelFormItem('Email'),
              buildDataUser(user.email!),
              labelFormItem('Telefone'),
              buildDataUser(user.phone!),
              labelFormItem('Site'),
              buildDataUser(user.website!),
              labelFormItem('Endereço'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelFormItem('Rua'),
                    buildDataUser(user.address.street),
                    labelFormItem('Cidade'),
                    buildDataUser(user.address.city),
                    labelFormItem('CEP'),
                    buildDataUser(user.address.zipcode),
                  ],
                ),
              ),
              labelFormItem('Empresa'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelFormItem('Nome'),
                    buildDataUser(user.company.name),
                    labelFormItem('Ramo'),
                    buildDataUser(user.company.bs),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButtonOptions(
                        text: 'Editar',
                        colorButton: Colors.blueAccent,
                        onTap: () {
                          pushNavigator(context, UserEditContainer(user: user));
                        }),
                    buildButtonOptions(
                        text: 'Deletar',
                        colorButton: Colors.redAccent,
                        onTap: () {
                          BlocProvider.of<UserCubit>(context)
                              .deleteUser(context, user.id!);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDataUser(String data) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: labelForm(data, Colors.grey[700]!),
    );
  }
}
