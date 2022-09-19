import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String pageRoute = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add),
        ],
      ),

      ///Vertical Divider
      const VerticalDivider(
        color: Colors.white,
        width: 2,
      ),

      ///Canvas Clock Side
      Expanded(
        child: Text(
          "This Feature will be added Soon",
          style: TextStyle(
            fontSize: 20.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      )
    ]));
  }
}
