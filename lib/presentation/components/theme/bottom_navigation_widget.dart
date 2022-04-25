import 'package:blog_teste_tecnico/presentation/bloc/bloc_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/posts_list/posts_list_container.dart';
import 'package:blog_teste_tecnico/presentation/bloc/users_list/users_list_container.dart';
import 'package:blog_teste_tecnico/presentation/components/theme/colors_components.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int index = 0;

  List<NavigationItem> items = [
    NavigationItem(
      const Icon(
        Icons.article,
        size: 40.0,
        color: floatActionButtonColor,
      ),
    ),
    NavigationItem(
      const Icon(
        Icons.person,
        size: 40.0,
        color: floatActionButtonColor,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
      child: Material(
        elevation: 50.0,
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ]),
          height: 70,
          padding: const EdgeInsets.only(left: 8, right: 8),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              var itemIndex = items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  if (itemIndex == 0) {
                    pushNavigator(context, const PostsListContainer());
                  } else {
                    pushNavigator(context, const UsersListContainer());
                  }
                },
                child: BuildItem(item: item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;

  NavigationItem(this.icon);
}

class BuildItem extends StatelessWidget {
  final NavigationItem item;

  const BuildItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[item.icon],
    );
  }
}
