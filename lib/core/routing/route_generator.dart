import 'package:blog_teste_tecnico/core/injection/injection.dart';
import 'package:blog_teste_tecnico/core/routing/routes.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/failure_dialog.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static final errorPage = MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: FailureDialog('Error'),
    );
  });

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<DashboardCubit>(
            create: (_) => getIt(),
            child: const DashboardPage(),
          ),
          settings: const RouteSettings(name: dashboardRoute),
        );

      default:
        return errorPage;
    }
  }
}
