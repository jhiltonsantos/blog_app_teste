import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user/user_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user/user_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_edit/user_edit_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/theme/colors_components.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/button_options.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/text_label_profile.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/text_profile_bs.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/title_label_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is InitUserState) {
        return _ViewUser(user: state.user);
      }
      if (state is LoadingUserState || state is SentDeleteUserState) {
        return const ProgressPage();
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
              const TitleLabelProfile(text: 'Perfil'),
              TextLabelProfile(text: 'Nome de Usuário', data: user.username!),
              TextLabelProfile(text: 'Email', data: user.email!),
              TextLabelProfile(text: 'Telefone', data: user.phone!),
              TextLabelProfile(text: 'Site', data: user.website!),
              const TitleLabelProfile(text: 'Endereço'),
              TextLabelProfile(text: 'Rua', data: user.address.street),
              TextLabelProfile(text: 'Cidade', data: user.address.city),
              TextLabelProfile(text: 'CEP', data: user.address.zipcode),
              const TitleLabelProfile(text: 'Empresa'),
              TextLabelProfile(text: 'Nome', data: user.company.name),
              TextProfileBS(text: 'Ramo', data: user.company.bs),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonOptionsWidget(
                        text: 'Editar',
                        colorButton: Colors.black,
                        onTap: () {
                          pushNavigator(context, UserEditContainer(user: user));
                        }),
                    ButtonOptionsWidget(
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
}


