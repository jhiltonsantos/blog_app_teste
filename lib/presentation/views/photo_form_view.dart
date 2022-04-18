import 'package:blog_teste_tecnico/domain/photo.dart';
import 'package:blog_teste_tecnico/presentation/bloc/photo_form/photo_form_bloc.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/label_form_item.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoFormView extends StatelessWidget {
  const PhotoFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoFormCubit, PhotoFormState>(
        builder: (context, state) {
      if (state is ShowPhotoFormState) {
        return _NewPhotoView();
      }
      if (state is SendingPhotoFormState || state is SentPhotoFormState) {
        return const ProgressView();
      }
      if (state is ErrorPhotoFormState) {
        return FailureDialog(state.message);
      }
      return const FailureDialog('Erro Desconhecido');
    });
  }
}

class _NewPhotoView extends StatelessWidget {
  _NewPhotoView({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBlogApp(
              title: 'Enviar Foto',
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
              labelFormItem('Título: '),
              textFieldItem(_titleController),
              labelFormItem('URL da Foto: '),
              textFieldItem(_urlController),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Enviar'),
                    onPressed: () {
                      final String _title = _titleController.text;
                      final String _url = _urlController.text;

                      if (_title.isEmpty || _url.isEmpty) {
                        const ErrorPhotoFormState('Faltando dados');
                      } else {
                        final _photoCreated = Photo(
                            albumId: 10,
                            id: 5001,
                            title: _title,
                            url: _url,
                            thumbnailUrl:
                            "https://via.placeholder.com/150/92c952");
                        BlocProvider.of<PhotoFormCubit>(context)
                            .save(_photoCreated, context);
                      }


                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
