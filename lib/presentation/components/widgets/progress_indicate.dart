import 'package:flutter/material.dart';

class ProgressIndicate extends StatelessWidget {
  const ProgressIndicate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          CircularProgressIndicator(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class ProgressView extends StatelessWidget {
  const ProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProgressIndicate(),
    );
  }
}

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Text(message),
    );
  }
}
