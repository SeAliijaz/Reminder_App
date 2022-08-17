import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/Canvas/clock_view.dart';
import 'package:reminder_app/Canvas/digital_clock_view.dart';

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
    ///variable in widget build
    var now = DateTime.now();
    var formattedDate = DateFormat('EEE, d/MMM/yyyy').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    ///Scaffold
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Clock',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Digital Clock view
              const DigitalClockWidget(),

              ///Date
              Text(
                formattedDate,
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ],
          ),

          ///Analog Clock
          ClockView(),

          ///TimeZone
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Timezone',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.language,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'UTC$offsetSign$timezoneString',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
