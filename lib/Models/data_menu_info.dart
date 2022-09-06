import 'package:reminder_app/Enums/enums.dart';
import 'package:reminder_app/Theme_Data/theme_data.dart';
import 'package:reminder_app/Models/alarm_info_model.dart';
import 'package:reminder_app/Models/menu_info_provider.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
    MenuType.clock,
    title: "Clock",
    imageSource: "assets/clock_icon.png",
  ),
  MenuInfo(
    MenuType.alarm,
    title: "Alarm",
    imageSource: "assets/alarm_icon.png",
  ),
  MenuInfo(
    MenuType.timer,
    title: "Timer",
    imageSource: "assets/timer_icon.png",
  ),
  MenuInfo(
    MenuType.stopwatch,
    title: "Stopwatch",
    imageSource: "assets/stopwatch_icon.png",
  ),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
    DateTime.now().add(
      Duration(hours: 1),
    ),
    gradientColors: GradientColors.sky,
    description: "Office",
  ),
  AlarmInfo(
    DateTime.now().add(
      Duration(hours: 2),
    ),
    gradientColors: GradientColors.sunset,
    description: "Sports",
  ),
];
