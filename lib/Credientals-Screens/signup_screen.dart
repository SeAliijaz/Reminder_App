import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String pageRoute = "/SignUpScreen";

  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: Center(
        child: Text('SignUpScreen'),
      ),
    );
  }
}
