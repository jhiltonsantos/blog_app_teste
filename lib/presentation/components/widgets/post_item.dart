import 'package:blog_teste_tecnico/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final Function onTap;

  const PostItem(this.post, {Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: ListTile(
          onTap: () => onTap(),
          leading: Text(
            post.id.toString(),
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
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Usuário: ${post.userId.toString()}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PostUserItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  final int index;

  const PostUserItem(this.post, {Key? key, required this.onTap, required this.index}) : super(key: key);

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
