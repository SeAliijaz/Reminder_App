import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/Theme_Data/theme_data.dart';
import 'package:reminder_app/Models/alarm_info_model.dart';
import 'package:reminder_app/Models/data_menu_info.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../main.dart';

class AlarmScreen extends StatelessWidget {
  AlarmScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Clock",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: ListView(
            children: alarms.map<Widget>((alarm) {
              return Container(
                margin: const EdgeInsets.only(bottom: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: alarm.gradientColors!.last.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(4, 4),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: alarm.gradientColors!,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.label,
                              size: 24,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              alarm.description!,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: true,
                          onChanged: (bool value) {},
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                    const Text(
                      "Mon-Fri",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat("hh:mm aa").format(alarm.alarmDateTime!),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_downward,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).followedBy([
              alarms.length < 5
                  ? DottedBorder(
                      strokeWidth: 2,
                      color: CustomColors.clockOutline,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(25),
                      dashPattern: const [5, 5],
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: CustomColors.clockBG,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: (() {}),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/add_alarm.png",
                                      scale: 1.5,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "add alarm".toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: Text(
                        "Only 5 Alarms are allowed",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
            ]).toList(),
          ))
        ],
      ),
    );
  }

  void scheduleAlarm() {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      icon: 'ic_launcher',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap(' ic_launcher '),
    ); // AndroidNotificationDetails
  }

  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      sound: ' a_long_cold_sting.wav ',
      presentAlert: true,
      presentBadge: true,
      presentSound: true);
}
