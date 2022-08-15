import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  StopWatchScreen({Key? key}) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  ///Functions
  ///stop function
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    seconds = 0;
    minutes = 0;
    hours = 0;

    digitSeconds = "00";
    digitMinutes = "00";
    digitHours = "00";

    started = false;
  }

  void addLaps() {
    String lap = "$digitSeconds:$digitMinutes:$digitHours";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2757),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "StopWatch Screen",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "00:00:00",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    color: Color(0xff323F68),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.lightBlue),
                      ),
                      child: Text(
                        "START".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.flag, color: Colors.white),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: RawMaterialButton(
                      fillColor: Colors.blue,
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.lightBlue),
                      ),
                      child: Text(
                        "RESET".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
