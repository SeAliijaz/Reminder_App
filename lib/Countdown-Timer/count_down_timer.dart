import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reminder_app/Countdown-Timer/Widgets/button_widget.dart';

class CountDownTimerScreen extends StatefulWidget {
  const CountDownTimerScreen({Key? key}) : super(key: key);

  @override
  State<CountDownTimerScreen> createState() => _CountDownTimerScreenState();
}

class _CountDownTimerScreenState extends State<CountDownTimerScreen> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  void _startTimer({bool reset = true}) {
    if (reset) {
      _resetTimer();
    }

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        _stopTimer(reset: false);
      }
    });
  }

  void _resetTimer() {
    setState(() {
      seconds = maxSeconds;
    });
  }

  void _stopTimer({bool reset = true}) {
    if (reset) {
      _resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: s.height,
              width: s.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ///Stopwatch timer
                  _buildTimer(),

                  ///buttons
                  _builButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builButtons() {
    final isRunning = timer != null ? timer!.isActive : false;
    final isCompleted = seconds == 0 || seconds == maxSeconds;
    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                text: isRunning ? "Pause" : "Resume",
                onClicked: () {
                  if (isRunning) {
                    _stopTimer(reset: false);
                  } else {
                    _startTimer(reset: false);
                  }
                },
              ),
              ButtonWidget(
                text: "Cancel",
                onClicked: _stopTimer,
              ),
            ],
          )
        : ButtonWidget(
            text: "Start Timer",
            onClicked: () {
              _startTimer();
            },
          );
  }

  Widget _buildTimer() {
    return SizedBox(
      height: 250,
      width: 250,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            color: Colors.red,
            value: 1 - seconds / maxSeconds,
            strokeWidth: 10,
            valueColor: AlwaysStoppedAnimation(Colors.white),
            backgroundColor: Colors.greenAccent,
          ),
          Center(
            child: _buildTime(),
          ),
        ],
      ),
    );
  }

  Widget _buildTime() {
    if (seconds == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.done,
            color: Colors.greenAccent,
            size: 100,
          ),
          Text(
            "Done",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      );
    } else {
      return Text(
        "$seconds",
        style: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }
  }
}
