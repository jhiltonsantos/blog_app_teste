import 'package:blog_teste_tecnico/presentation/bloc/photo_form/photo_form_bloc.dart';
import 'package:blog_teste_tecnico/presentation/components/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/views/photo_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoFormContainer extends BlocContainer {

  const PhotoFormContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoFormCubit>(
      create: (BuildContext context) {
        return PhotoFormCubit();
      },
      child: BlocListener<PhotoFormCubit, PhotoFormState>(
        listener: (context, state) {
          if (state is SentPhotoFormState) {
            showSuccessfulDialog(context, 'Foto Enviada');
          }
        },
        child: const PhotoFormView(),
      ),
    );
  }
}
