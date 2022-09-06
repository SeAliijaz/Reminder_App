import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime? alarmDateTime;
  String? description;
  bool? isActive;
  List<Color>? gradientColors;

  String? title;

  AlarmInfo(
    this.alarmDateTime, {
    this.description,
    this.gradientColors,
  });
}
