import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String pageRoute = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeScreen'),
        ),
        body: Column(
          children: [
            Text("Data in Column\n Vertical"),
          ],
        ));
  }
}
