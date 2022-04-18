import 'package:blog_teste_tecnico/domain/photo.dart';
import 'package:blog_teste_tecnico/presentation/bloc/photo_edit/photo_edit_bloc.dart';
import 'package:blog_teste_tecnico/presentation/bloc/user_edit/user_edit_bloc.dart';
import 'package:blog_teste_tecnico/presentation/components/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/views/photo_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoEditContainer extends BlocContainer {
  final Photo photo;

  const PhotoEditContainer({Key? key, required this.photo,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoEditCubit>(
      create: (BuildContext context) {
        return PhotoEditCubit();
      },
      child: BlocListener<PhotoEditCubit, PhotoEditState>(
        listener: (context, state) {
          if (state is SentUserEditState) {
            showSuccessfulDialog(context, 'Foto Atualizada');
          }
        },
        child: PhotoEditView(photo: photo),
      ),
    );
  }
}
