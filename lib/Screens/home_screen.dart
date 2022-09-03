import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/Constants/enums.dart';
import 'package:reminder_app/Constants/theme_data.dart';
import 'package:reminder_app/Countdown-Timer/count_down_timer.dart';
import 'package:reminder_app/Models/data_menu_info.dart';
import 'package:reminder_app/Models/menu_info.dart';
import 'package:reminder_app/Screens/alarm_screen.dart';
import 'package:reminder_app/Screens/clock_screen.dart';
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
            width: 1,
          ),

          ///Canvas Clock Side
          Expanded(
            child: Consumer<MenuInfo>(
              builder: ((context, value, child) {
                if (value.menuType == MenuType.clock) {
                  return ClockScreen();
                } else if (value.menuType == MenuType.alarm) {
                  return AlarmScreen();
                } else if (value.menuType == MenuType.timer) {
                  return CountDownTimerScreen();
                } else if (value.menuType == MenuType.stopwatch) {
                  return StopWatchScreen();
                } else {
                  return Center(
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
                )
              ],
            ));
      }),
    );
  }
}
  // return Container(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Flexible(
                //         flex: 1,
                //         fit: FlexFit.tight,
                //         child: const Text(
                //           "Clock",
                //           style: TextStyle(
                //               fontSize: 24,
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       Flexible(
                //         flex: 2,
                //         fit: FlexFit.tight,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             ///Format Time
                //             ///DateTime.now();
                //             Text(
                //               formattedTime,
                //               style: const TextStyle(
                //                 fontSize: 45,
                //                 color: Colors.white,
                //               ),
                //             ),

                //             ///Format Date
                //             Text(
                //               formattedDate,
                //               style: const TextStyle(
                //                 fontSize: 20,
                //                 color: Colors.white60,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),

                //       ///clock view
                //       Flexible(
                //         flex: 4,
                //         fit: FlexFit.tight,
                //         child: Align(
                //           alignment: Alignment.center,
                //           child: ClockView(
                //               size: MediaQuery.of(context).size.height / 4),
                //         ),
                //       ),
                //       Flexible(
                //         flex: 2,
                //         fit: FlexFit.tight,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Text(
                //               "Time zone",
                //               style: TextStyle(
                //                 fontSize: 20,
                //                 color: Colors.white,
                //               ),
                //             ),
                //             Row(
                //               children: [
                //                 const Icon(
                //                   Icons.language,
                //                   color: Colors.white,
                //                 ),
                //                 const SizedBox(width: 10),
                //                 Text(
                //                   "utc".toUpperCase() +
                //                       offSetSign +
                //                       timeZoneString,
                //                   style: const TextStyle(
                //                     fontSize: 20,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               ],
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // );


                    // ///This DateTime widget constructs a [DateTime] instance
    // ///With current date and time in the local time zone.
    // DateTime dateTimeNow = DateTime.now();

    // ///Time format for example like
    // ///DateFormat.jm() -------> 5:08 PM <-------
    // var formattedTime = DateFormat.jm().format(dateTimeNow);

    // ///Date format like
    // ///Wed, 24/08/2022
    // var formattedDate = DateFormat("EEE, dd/MM/yyyy").format(dateTimeNow);
    // var timeZoneString = dateTimeNow.timeZoneOffset.toString().split(".").first;
    // var offSetSign = "";
    // if (!timeZoneString.startsWith("-")) offSetSign = "+";
    // debugPrint(timeZoneString.toString());