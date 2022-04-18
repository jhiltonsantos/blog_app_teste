// ignore_for_file: avoid_print

// import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
// import 'package:blog_teste_tecnico/data/repositories/user_repository.dart';
// import 'package:blog_teste_tecnico/domain/address.dart';
// import 'package:blog_teste_tecnico/domain/company.dart';
// import 'package:blog_teste_tecnico/domain/geo.dart';
// import 'package:blog_teste_tecnico/domain/user.dart';
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
