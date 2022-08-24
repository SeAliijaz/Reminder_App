import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reminder_app/Debug-Screen/debug_screen.dart';
import 'package:reminder_app/Reminder/services.dart';
import 'package:reminder_app/Screens/home_screen.dart';
import 'package:sizer/sizer.dart';

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
        ///Connected to Firebase
        return FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              debugPrint("something went wrong");
              Fluttertoast.showToast(msg: "something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Reminder app',

                ///HOME
                home: kReleaseMode ? HomeScreen() : DebugScreen(),
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
