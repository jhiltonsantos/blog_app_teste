import 'package:blog_teste_tecnico/domain/entities/address.dart';
import 'package:blog_teste_tecnico/domain/entities/company.dart';
import 'package:blog_teste_tecnico/domain/entities/geo.dart';
import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/label_form_item.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_form/user_form_bloc.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFormView extends StatelessWidget {
  const UserFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(builder: (context, state) {
      if (state is ShowUserFormState) {
        return _NewUserView();
      }
      if (state is SendingUserFormState || state is SentUserFormState) {
        return const ProgressView();
      }
      if (state is ErrorUserFormState) {
        return FailureDialog(state.message);
      }
      return const FailureDialog('Erro Desconhecido');
    });
  }
}

class _NewUserView extends StatelessWidget {
  _NewUserView({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Novo Usuário',
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
              labelFormItem('Nome Completo: '),
              textFieldItem(_nameController),
              labelFormItem('Nome de Usuário: '),
              textFieldItem(_usernameController),
              labelFormItem('Email: '),
              textFieldItem(_emailController),
              labelFormItem('Telefone: '),
              textFieldItem(_phoneController),
              labelFormItem('Site: '),
              textFieldItem(_websiteController),
              const SizedBox(height: 20.0),
              labelFormItem('Endereço'),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              labelFormItem('Rua'),
              textFieldItem(_streetController),
              labelFormItem('Cidade'),
              textFieldItem(_cityController),
              labelFormItem('CEP'),
              textFieldItem(_cepController),
              const SizedBox(height: 20.0),
              labelFormItem('Empresa'),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              labelFormItem('Nome'),
              textFieldItem(_nameCompanyController),
              labelFormItem('Ramo'),
              textFieldItem(_bsCompanyController),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Criar'),
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
                        const ErrorUserFormState('Tempo Excedido na Execução');
                      } else {
                        final userCreated = User(
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

                        BlocProvider.of<UserFormCubit>(context)
                            .save(userCreated, context);
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
