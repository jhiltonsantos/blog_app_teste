import 'package:blog_teste_tecnico/features/blog/domain/entities/address.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/company.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/geo.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_edit/user_edit_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/user_edit/user_edit_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/label_form_item.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserEditPage extends StatelessWidget {
  final User user;

  const UserEditPage({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserEditCubit, UserEditState>(builder: (context, state) {
      if (state is ShowUserEditState) {
        return _UpdateUserView(user: user);
      }
      if (state is SendingUserEditState || state is SentUserEditState) {
        return const ProgressPage();
      }
      if (state is ErrorUserEditState) {
        return FailureDialog(state.message);
      }
      return const FailureDialog('Erro Desconhecido');
    });
  }
}

class _UpdateUserView extends StatelessWidget {
  final User user;

  _UpdateUserView({Key? key, required this.user}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _nameCompanyController = TextEditingController();
  final TextEditingController _bsCompanyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = user.name!;
    _usernameController.text = user.username!;
    _emailController.text = user.email!;
    _streetController.text = user.address.street;
    _cityController.text = user.address.city;
    _cepController.text = user.address.zipcode;
    _phoneController.text = user.phone!;
    _websiteController.text = user.website!;
    _nameCompanyController.text = user.company.name;
    _bsCompanyController.text = user.company.bs;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Atualizar Usuário',
              leadingIcon: Icons.arrow_back,
              leadingOnTap: () {
                Navigator.pop(context);
              },
              rightIcon: Icons.account_circle_outlined),
          preferredSize: const Size.fromHeight(120)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const LabelFormItem(title: 'Nome Completo: '),
              TextFieldItem(controller: _nameController),
              const LabelFormItem(title: 'Nome de Usuário: '),
              TextFieldItem(controller: _usernameController),
              const LabelFormItem(title: 'Email: '),
              TextFieldItem(controller: _emailController),
              const LabelFormItem(title: 'Telefone: '),
              TextFieldItem(controller: _phoneController),
              const LabelFormItem(title: 'Site: '),
              TextFieldItem(controller: _websiteController),
              const SizedBox(height: 20.0),
              const LabelFormItem(title: 'Endereço'),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const LabelFormItem(title: 'Rua'),
              TextFieldItem(controller: _streetController),
              const LabelFormItem(title: 'Cidade'),
              TextFieldItem(controller: _cityController),
              const LabelFormItem(title: 'CEP'),
              TextFieldItem(controller: _cepController),
              const SizedBox(height: 20.0),
              const LabelFormItem(title: 'Empresa'),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const LabelFormItem(title: 'Nome'),
              TextFieldItem(controller: _nameCompanyController),
              const LabelFormItem(title: 'Ramo'),
              TextFieldItem(controller: _bsCompanyController),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Atualizar'),
                    onPressed: () {
                      final String _nameComplete = _nameController.text;
                      final String _username = _usernameController.text;
                      final String _email = _emailController.text;
                      final String _phone = _phoneController.text;
                      final String _website = _websiteController.text;
                      final String _street = _streetController.text;
                      final String _city = _cityController.text;
                      final String _cep = _cepController.text;
                      final String _nameCompany = _nameCompanyController.text;
                      final String _bsCompany = _bsCompanyController.text;

                      if (_nameComplete.isEmpty) {
                        const ErrorUserEditState('Tempo Excedido na Execução');
                      } else {
                        final _userUpdate = User(
                          11,
                          _nameComplete,
                          _username,
                          _email,
                          Address(
                              _street, 'Suite', _city, _cep, Geo('lat', 'lng')),
                          _phone,
                          _website,
                          Company(_nameCompany, 'Frase', _bsCompany),
                        );

                        BlocProvider.of<UserEditCubit>(context)
                            .save(user.id!, _userUpdate, context);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
