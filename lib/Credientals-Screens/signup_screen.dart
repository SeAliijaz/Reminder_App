import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String pageRoute = "/SignUpScreen";

  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUpScreen'),
      ),
      body: Center(
        child: Text('SignUpScreen'),
      ),
    );
  }
}
