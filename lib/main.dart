import 'package:blog_teste_tecnico/core/injection/injection.dart';
import 'package:blog_teste_tecnico/core/routing/route_generator.dart';
import 'package:blog_teste_tecnico/core/routing/routes.dart';
import 'package:flutter/material.dart';

import 'features/blog/presentation/components/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blogAppTheme,
      initialRoute: dashboardRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
