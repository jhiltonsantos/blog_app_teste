import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:blog_teste_tecnico/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:blog_teste_tecnico/presentation/bloc/photo/photo_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/photo_form/photo_form_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/app_bar_blog_app.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/bottom_navigation_widget.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/photo_item.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/progress_indicate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBarBlogApp(
          title: 'Blog App',
          fontSize: 28.0,
          leadingIcon: Icons.stream_outlined,
          rightIcon: Icons.account_circle_outlined,
        ),
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is InitDashboardState || state is LoadingDashboardState) {
            return const ProgressIndicate();
          }
          if (state is LoadedDashboardState) {
            final photos = state.photos;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Photo photo = photos[index];
                return PhotoItem(
                  photo: photo,
                  onTap: () async {
                    pushNavigator(context, PhotoContainer(photo));
                  },
                );
              },
              itemCount: photos.length,
            );
          }
          if (state is ErrorDashboardState) {
            return FailureDialog(state.message);
          }
          return const Center(
            child: Text(
              'Erro Desconhecido',
              style: TextStyle(fontSize: 42.0),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 20.0,
        highlightElevation: 50.0,
        splashColor: Colors.amber,
        onPressed: () async {
          pushNavigator(context, const PhotoFormContainer());
        },
        child: const Icon(
          Icons.add_photo_alternate_outlined,

        ),
      ),
    );
  }
}


