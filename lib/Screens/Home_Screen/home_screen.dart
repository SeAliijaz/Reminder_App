import 'package:flutter/material.dart';
import 'package:reminder_app/Canvas/clock_screen.dart';
import 'package:reminder_app/Reminder/reminder_screen.dart';
import 'package:reminder_app/Screens/Module_Screens/Countdown-Timer/count_down_timer.dart';
import 'package:reminder_app/Screens/Module_Screens/Stopwatch/Notepad/Notes_Screens/Show_Data_Screen/show_data_home_screen.dart';
import 'package:reminder_app/Screens/Module_Screens/Stopwatch/Stopwatch_Screen/stop_watch_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String pageRoute = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List _pages = [
    ClockScreen(),
    ReminderScreen(),
    StopWatchScreen(),
    CountDownTimerScreen(),
    ShowDataScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/clock_icon.png",
                scale: 2.2,
              ),
              label: 'Clock',
              tooltip: "Clock Screen",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/add_alarm.png",
                scale: 2.2,
              ),
              label: 'Alarm',
              tooltip: "Alarm Screen",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/stopwatch_icon.png",
                scale: 2.2,
              ),
              label: 'Stopwatch',
              tooltip: "Stopwatch Screen",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/alarm_icon.png",
                scale: 2.2,
              ),
              label: 'Timer',
              tooltip: "Countdown Timer",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.note_add_sharp,
                size: 30,
              ),
              label: 'Notes',
              tooltip: "Notes",
            ),
          ]),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
