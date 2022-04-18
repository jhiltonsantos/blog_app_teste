import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:blog_teste_tecnico/presentation/bloc/photo/photo_bloc.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/presentation/views/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoContainer extends BlocContainer {
  final Photo photo;

  const PhotoContainer(this.photo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotoCubit(photo: photo),
      child: BlocListener<PhotoCubit, PhotoState>(
        listener: (context, state) {
          if (state is SentDeletePhotoState) {
            showSuccessfulDialog(context, 'Foto Deletada');
          }
        },
        child: const PhotoView(),
      ),
    );
  }
}
