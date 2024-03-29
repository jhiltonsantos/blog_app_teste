import 'package:flutter/material.dart';

class AppBarBlogApp extends StatelessWidget {
  final String title;
  final double? fontSize;
  final int? flex;
  final double? padding;
  final Function()? leadingOnTap;
  final IconData leadingIcon;
  final IconData rightIcon;

  const AppBarBlogApp({
    Key? key,
    required this.title,
    this.leadingOnTap,
    this.fontSize,
    required this.leadingIcon,
    required this.rightIcon, this.flex, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: leadingOnTap ?? () {},
                child: Icon(leadingIcon, size: 30.0),
              ),
              // TODO: Melhorar title da AppBar
              Expanded(
                flex: flex ?? 0,
                child: Padding(
                  padding: EdgeInsets.only(left: padding ?? 0),
                  child: Text(
                    title,
                    style:  TextStyle(
                      fontSize: fontSize ?? 24.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ),
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
