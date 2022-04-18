import 'package:blog_teste_tecnico/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/presentation/components/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_bloc.dart';

class DashboardContainer extends BlocContainer {
  const DashboardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotoRepository photo = PhotoRepository();
    return BlocProvider<DashboardCubit>(
        child: const DashboardView(),
        create: (BuildContext context) {
          final cubit = DashboardCubit();
          cubit.reloadList(photo);
          return cubit;
        });
  }
}