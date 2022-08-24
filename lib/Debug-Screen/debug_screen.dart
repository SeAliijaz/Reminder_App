import 'package:flutter/material.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              "https://cdn-icons-png.flaticon.com/512/1541/1541402.png"),
          SizedBox(height: 10),
          Text(
            'Debug Screen\n Your app is in Debug Mode',
            style: TextStyle(
              fontSize: 25.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
