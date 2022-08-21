import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/Canvas/clock_view.dart';
import 'package:reminder_app/Canvas/digital_clock_view.dart';

class HomeScreenClockView extends StatefulWidget {
  const HomeScreenClockView({Key? key}) : super(key: key);

  @override
  State<HomeScreenClockView> createState() => _HomeScreenClockViewState();
}

class _HomeScreenClockViewState extends State<HomeScreenClockView> {
  @override
  Widget build(BuildContext context) {
    ///variable in widget build
    var now = DateTime.now();
    var formattedDate = DateFormat('EEE, d/MMM/yyyy').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Clock',
              style: GoogleFonts.salsa(fontSize: 30, color: Colors.white),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Digital Clock view
                const DigitalClockWidget(),

                ///Date
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),

          ///Analog Clock
          Column(
            children: [
              ClockView(),
            ],
          ),

          SizedBox(height: 15),

          ///TimeZone
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Timezone',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'UTC$offsetSign$timezoneString',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
