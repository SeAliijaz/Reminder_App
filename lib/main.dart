import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reminder_app/Credientals-Screens/login_screen.dart';
import 'package:reminder_app/Credientals-Screens/signup_screen.dart';
import 'package:reminder_app/Notepad/Notes_Screens/Add_Data_Screen/add_data_screen.dart';
import 'package:reminder_app/Notepad/Notes_Screens/Edit_Data_Screen/edit_data_screen.dart';
import 'package:reminder_app/Reminder/reminder_screen.dart';
import 'package:reminder_app/Reminder/services.dart';
import 'package:reminder_app/Screens/home_screen.dart';
import 'package:reminder_app/Stopwatch/stop_watch_screen.dart';
import 'package:sizer/sizer.dart';

import 'Notepad/Notes_Screens/Show_Data_Screen/show_data_home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService notificationService = NotificationService();
  await notificationService.initReminder();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        ///FutureBuilder
        return FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              debugPrint("something went wrong");
              Fluttertoast.showToast(msg: "something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              ///GETX
              ///GetMaterialApp
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Reminder app',
                theme: ThemeData(
                  scaffoldBackgroundColor: const Color(0xff1c2757),
                ),

                ///HOME
                home: const HomeScreen(),

                ///PageRoute
                routes: {
                  HomeScreen.pageRoute: (p0) => const HomeScreen(),
                  LogInScreen.pageRoute: (p0) => const LogInScreen(),
                  SignUpScreen.pageRoute: (p0) => const SignUpScreen(),
                  ShowDataScreen.pageRoute: (p0) => const ShowDataScreen(),
                  AddDataScreen.pageRoute: (p0) => AddDataScreen(),
                  EditDataScreen.pageRoute: (p0) => EditDataScreen(),
                  ReminderScreen.pageRoute: (p0) => const ReminderScreen(),
                  StopWatchScreen.pageRoute: (p0) => const StopWatchScreen(),
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      }),
    );
  }
}


// class NotesDataWidget extends StatelessWidget {
//   const NotesDataWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasData &&
//             snapshot.connectionState == ConnectionState.active) {
//           return const ShowDataScreen();
//         }
//         if (!snapshot.hasData &&
//             snapshot.connectionState == ConnectionState.waiting) {
//           return CustomProgressIndicator(
//             textMessage: "Waiting for Connection...",
//           );
//         }
//         if (!snapshot.hasData &&
//             snapshot.connectionState == ConnectionState.none) {
//           return CustomProgressIndicator(
//             textMessage: "No Connection...",
//           );
//         }
//         if (!snapshot.hasData &&
//             snapshot.connectionState == ConnectionState.none &&
//             snapshot.connectionState == ConnectionState.waiting) {
//           return CustomProgressIndicator(
//             textMessage: "Waiting For Response",
//           );
//         } else {
//           return CustomProgressIndicator(
//             textMessage: "Loading...",
//           );
//         }
//       },
//     );
//   }
// }
