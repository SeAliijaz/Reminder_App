import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  static const String pageRoute = "/LogInScreen";

  const LogInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('LogInScreen'),
      ),
      body: Center(
        child: Text('LogInScreen'),
      ),
    );
  }
}
