import 'package:blog_teste_tecnico/presentation/bloc/dashboard/dashboard_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blogAppTheme,
      home: const DashboardContainer(),
    );
  }
}
