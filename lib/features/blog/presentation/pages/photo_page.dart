import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/photo/photo_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/photo/photo_state.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/photo_edit/photo_edit_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/theme/colors_components.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/button_options.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/progress_indicate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoCubit, PhotoState>(
      builder: (context, state) {
        if (state is InitPhotoState) {
          return _ViewPhoto(photo: state.photo);
        }
        if (state is LoadingPhotoState || state is SentDeletePhotoState) {
          return const ProgressPage();
        }
        if (state is ErrorPhotoState) {
          return FailureDialog(state.message);
        }
        return const FailureDialog('Erro Desconhecido');
      },
    );
  }
}

class _ViewPhoto extends StatelessWidget {
  final Photo photo;

  const _ViewPhoto({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarBlogApp(
            title: 'Foto ${photo.id}',
            leadingIcon: Icons.arrow_back,
            leadingOnTap: () {
              Navigator.pop(context);
            },
            rightIcon: Icons.account_circle_outlined),
        preferredSize: const Size.fromHeight(120),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  photo.url!,
                  scale: 0.5,
                  width: 300,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  photo.title!,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Álbum: ${photo.albumId!}',
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonOptionsWidget(
                        text: 'Editar',
                        colorButton: Colors.black,
                        onTap: () {
                          pushNavigator(
                              context, PhotoEditContainer(photo: photo));
                        }),
                    ButtonOptionsWidget(
                        text: 'Deletar',
                        colorButton: floatActionButtonColor,
                        onTap: () {
                          BlocProvider.of<PhotoCubit>(context)
                              .delete(photo.id!, context);
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
