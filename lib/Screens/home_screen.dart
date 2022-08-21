import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reminder_app/Countdown-Timer/count_down_timer.dart';
import 'package:reminder_app/Reminder/reminder_screen.dart';
import 'package:reminder_app/Screens/home_screen_clock_view.dart';
import 'package:reminder_app/Stopwatch/stop_watch_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
    CountDownTimerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ///Scaffold
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.blue,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home Screen"),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.alarm),
                title: Text("Reminder Screen"),
              ),
              SalomonBottomBarItem(
                icon: FaIcon(FontAwesomeIcons.stopwatch),
                title: Text("Stopwatch SCreen"),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.lock_clock),
                title: Text("Countdown timer"),
              ),
            ]),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
