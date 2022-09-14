import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/Enums/enums.dart';
import 'package:reminder_app/Theme_Data/theme_data.dart';
import 'package:reminder_app/Screens/Module_Screens/Stopwatch/Countdown-Timer/count_down_timer.dart';
import 'package:reminder_app/Models/data_menu_info.dart';
import 'package:reminder_app/Models/menu_info_provider.dart';
import 'package:reminder_app/Screens/Reminder-Screen/alarm_screen.dart';
import 'package:reminder_app/Screens/Reminder-Screen/clock_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((currentMenuInfo) {
              return buildMenuButtons(currentMenuInfo);
            }).toList(),
          ),

          ///Vertical Divider
          const VerticalDivider(
            color: Colors.white,
            width: 2,
          ),

          ///Canvas Clock Side
          Expanded(
            child: Consumer<MenuInfo>(
              builder: ((context, value, child) {
                if (value.menuType == MenuType.clock) {
                  return const ClockScreen();
                } else if (value.menuType == MenuType.alarm) {
                  return AlarmScreen();
                } else if (value.menuType == MenuType.timer) {
                  return const CountDownTimerScreen();
                } else if (value.menuType == MenuType.stopwatch) {
                  return const StopWatchScreen();
                } else {
                  return const Center(
                    child: Text(
                      "This Feature will be added Soon",
                      style: TextStyle(
                        fontSize: 20.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButtons(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: ((BuildContext context, MenuInfo value, child) {
        return MaterialButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
            )),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
            color: currentMenuInfo.menuType == value.menuType
                ? CustomColors.menuBackgroundColor
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource ?? "",
                  scale: 1.5,
                ),
                const SizedBox(height: 15),
                Text(
                  currentMenuInfo.title ?? "",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ));
      }),
    );
  }
}