import 'package:flutter/material.dart';

abstract class BlocContainer extends StatelessWidget {
  const BlocContainer({Key? key}) : super(key: key);
}

void pushNavigator(BuildContext blocContext, BlocContainer container) {
  Navigator.push(
    blocContext,
    MaterialPageRoute(
      builder: (context) => container,
    ),
  );
}
