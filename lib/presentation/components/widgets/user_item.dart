import 'package:blog_teste_tecnico/domain/user.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final User user;
  final Function onTap;

  const UserItem({Key? key, required this.onTap, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onTap(),
        leading: Text(
          user.id.toString(),
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        title: Text(
          user.name!,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Empresa: ${user.company.name.toString()}',
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
