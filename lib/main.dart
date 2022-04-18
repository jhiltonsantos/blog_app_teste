import 'package:blog_teste_tecnico/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/presentation/bloc/dashboard/dashboard_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  final PostRepository _postWebClient = PostRepository();
  _postWebClient
      .findAllPostsByUser(2)
      .then((get) => print('GET USER POSTS MAIN: $get'));

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
