import 'package:blog_teste_tecnico/features/blog/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
class DashboardContainer extends BlocContainer {
  const DashboardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotoRepository photo = PhotoRepository();
    return BlocProvider<DashboardCubit>(
        child: const DashboardPage(),
        create: (BuildContext context) {
          final cubit = DashboardCubit();
          cubit.reloadList(photo);
          return cubit;
        });
  }
}

*/