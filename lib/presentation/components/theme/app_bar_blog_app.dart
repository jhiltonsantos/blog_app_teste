import 'package:flutter/material.dart';

class AppBarBlogApp extends StatelessWidget {
  final String title;
  final Function()? leadingOnTap;
  final IconData leadingIcon;
  final IconData rightIcon;

  const AppBarBlogApp({
    Key? key, required this.title, this.leadingOnTap, required this.leadingIcon, required this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: leadingOnTap ?? () {},
                child: Icon(
                    leadingIcon,
                    size: 30.0
                ),
              ),
              Text(title, style: const TextStyle(fontSize: 26.0),),
              Icon(
                rightIcon,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}