import 'package:blog_teste_tecnico/core/routing/routes.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/dashboard/dashboard_container.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/components/widgets/failure_dialog.dart';
import 'package:flutter/material.dart';

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
          builder: (context) {
            return const DashboardContainer();
          },
          settings: const RouteSettings(name: dashboardRoute),
        );

      default:
        return errorPage;
    }
  }
}
