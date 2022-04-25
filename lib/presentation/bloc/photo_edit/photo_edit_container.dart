import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:blog_teste_tecnico/presentation/bloc/photo_edit/photo_edit_cubit.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/photo_edit/photo_edit_state.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/pages/photo_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoEditContainer extends BlocContainer {
  final Photo photo;

  const PhotoEditContainer({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoEditCubit>(
      create: (BuildContext context) {
        return PhotoEditCubit();
      },
      child: BlocListener<PhotoEditCubit, PhotoEditState>(
        listener: (context, state) {
          if (state is SentPhotoEditState) {
            showSuccessfulDialog(context, 'Foto Atualizada');
          }
        },
        child: PhotoEditPage(photo: photo),
      ),
    );
  }
}
