import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/Canvas/clock_view.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    ///formattedTime
    var formattedTime = DateFormat.jm().format(DateTime.now());

    ///formattedDate
    var formattedDate = DateFormat('EEE, d/MM/yyyy').format(DateTime.now());
    var timezoneString =
        DateTime.now().timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    ///Creates a visual scaffold for Material Design widgets.
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                "Clock",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Format Time
                  Text(
                    formattedTime,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),

                  ///Format Date
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),

            ///clock view
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Align(
                alignment: Alignment.center,
                child: ClockView(
                  size: MediaQuery.of(context).size.height / 4,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Time zone",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "utc".toUpperCase() + offsetSign + timezoneString,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
