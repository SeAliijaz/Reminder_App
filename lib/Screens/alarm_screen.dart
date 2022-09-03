import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/Constants/theme_data.dart';
import 'package:reminder_app/Models/data_menu_info.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Clock",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: ListView(
            children: alarms.map<Widget>((alarm) {
              return Container(
                margin: EdgeInsets.only(bottom: 30),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: alarm.gradientColors!.last.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(4, 4),
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
                            Icon(
                              Icons.label,
                              size: 24,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              alarm.description!,
                              style: TextStyle(
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
                    Text(
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
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
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
              DottedBorder(
                strokeWidth: 2,
                color: CustomColors.clockOutline,
                borderType: BorderType.RRect,
                radius: Radius.circular(25),
                dashPattern: [5, 5],
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
                              SizedBox(height: 10),
                              Text(
                                "add alarm",
                                style: TextStyle(
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
              ),
            ]).toList(),
          ))
        ],
      ),
    );
  }
}
