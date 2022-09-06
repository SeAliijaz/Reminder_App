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
    ///This DateTime widget constructs a [DateTime] instance
    ///With current date and time in the local time zone.
    DateTime dateTimeNow = DateTime.now();

    ///Time format for example like
    ///DateFormat.jm() -------> 5:08 PM <-------
    var formattedTime = DateFormat.jm().format(dateTimeNow);

    ///Date format like
    ///Wed, 24/08/2022
    var formattedDate = DateFormat("EEE, dd/MM/yyyy").format(dateTimeNow);
    var timeZoneString = dateTimeNow.timeZoneOffset.toString().split(".").first;
    var offSetSign = "";
    if (!timeZoneString.startsWith("-")) offSetSign = "+";
    debugPrint(timeZoneString.toString());

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
                  ///DateTime.now();
                  Text(
                    formattedTime,
                    style: const TextStyle(
                      fontSize: 45,
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
                child: ClockView(size: MediaQuery.of(context).size.height / 4),
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
                        "utc".toUpperCase() + offSetSign + timeZoneString,
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
