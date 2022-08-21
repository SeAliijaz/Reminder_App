import 'package:flutter/material.dart';
import 'package:reminder_app/Reminder/reminder_screen.dart';
import 'package:reminder_app/Screens/home_screen_clock_view.dart';
import 'package:reminder_app/Stopwatch/stop_watch_screen.dart';

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
    HomeScreenClockView(),
    ReminderScreen(),
    StopWatchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ///Scaffold
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Alarm Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch),
              label: 'Stopwatch screen',
            ),
          ],
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
