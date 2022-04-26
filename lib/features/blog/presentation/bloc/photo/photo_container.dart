import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/photo/photo_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/photo/photo_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/show_successful_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/photo_page.dart';
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
        child: const PhotoPage(),
      ),
    );
  }
}
