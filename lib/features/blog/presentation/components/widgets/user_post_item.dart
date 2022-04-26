import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:flutter/material.dart';

class UserPostItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  final int index;

  const UserPostItem(this.post,
      {Key? key, required this.onTap, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            onTap: () => onTap(),
            leading: Text(
              index.toString(),
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            title: Text(
              post.title,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
