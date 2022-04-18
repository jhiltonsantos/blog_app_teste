import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user/user_bloc.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_edit/user_edit_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/colors_components.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/button_options.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/label_form.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/label_form_item.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
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
              const Text(
                'Visão Geral',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              buildLabelProfile('Perfil'),
              buildTextProfile(text: 'Nome de Usuário', data: user.username!),
              buildTextProfile(text: 'Email', data: user.email!),
              buildTextProfile(text: 'Telefone', data: user.phone!),
              buildTextProfile(text: 'Site', data: user.website!),
              buildLabelProfile('Endereço'),
              buildTextProfile(text: 'Rua', data: user.address.street),
              buildTextProfile(text: 'Cidade', data: user.address.city),
              buildTextProfile(text: 'CEP', data: user.address.zipcode),
              buildLabelProfile('Empresa'),
              buildTextProfile(text: 'Nome', data: user.company.name),
              buildTextProfileBS(text: 'Ramo', data: user.company.bs),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButtonOptions(
                        text: 'Editar',
                        colorButton: Colors.black,
                        onTap: () {
                          pushNavigator(context, UserEditContainer(user: user));
                        }),
                    buildButtonOptions(
                        text: 'Deletar',
                        colorButton: floatActionButtonColor,
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

  Padding buildLabelProfile(String text) {
    return  Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Text(
                text,
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            );
  }

  Column buildTextProfile({required String text, required String data}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            labelFormItem(text, size: 20, color: Colors.grey[700]!),
            buildDataUser(data),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(
            height: 2,
            thickness: 2,
          ),
        ),
      ],
    );
  }

  Column buildTextProfileBS({required String text, required String data}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: labelFormItem(text, size: 20, color: Colors.grey[700]!)),
            Expanded(child: buildDataUser(data)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(
            height: 2,
            thickness: 2,
          ),
        ),
      ],
    );
  }

  Padding buildDataUser(String data) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: labelForm(data, Colors.black, size: 20.0),
    );
  }
}
