import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/Canvas/clock_view.dart';

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
    var now = DateTime.now();
    var formattedTime = DateFormat.jm().format(now);
    var formattedDate = DateFormat("EEE, dd/MM/yyyy").format(now);
    var timeZoneString = now.timeZoneOffset.toString().split(".").first;
    var offSetSign = "";
    if (!timeZoneString.startsWith("-")) offSetSign = "+";
    debugPrint(timeZoneString.toString());

    return Scaffold(
      backgroundColor: const Color(0XFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButtons("Clock", "assets/clock_icon.png"),
              buildMenuButtons("alarm", "assets/alarm_icon.png"),
              buildMenuButtons("timer", "assets/timer_icon.png"),
              buildMenuButtons("stopwatch", "assets/stopwatch_icon.png"),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
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
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),

                        ///Format Date
                        Text(
                          formattedDate,
                          style: TextStyle(
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
                          size: MediaQuery.of(context).size.height / 4),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Time zone",
                          style: const TextStyle(
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
          ),
        ],
      ),
    );
  }

  Padding buildMenuButtons(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
          onPressed: () {},
          child: Column(
            children: [
              Image.asset(
                image,
                scale: 1.5,
              ),
              SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ],
          )),
    );
  }
}
