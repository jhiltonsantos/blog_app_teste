import 'package:blog_teste_tecnico/features/blog/presentation/bloc/photo_form/photo_form_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/photo_form/photo_form_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/photo_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_container.dart';

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
        child: const PhotoFormPage(),
      ),
    );
  }
}
