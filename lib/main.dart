import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reminder_app/Notes-WorkSpace/Notes_Screens/Show_Data_Screen/show_data_home_screen.dart';
import 'package:reminder_app/Notes-WorkSpace/Widgets/custom_progress_indicator.dart';
import 'package:reminder_app/Reminder/services.dart';
import 'package:reminder_app/Services/theme_services.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DBHelper.initDb();
  await GetStorage.init();
  NotificationService notificationService = NotificationService();
  await notificationService.initReminder();
  runApp(MyApp());
}

///global navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Reminder app',
                theme: Themes.light,
                themeMode: ThemeServices().theme,
                darkTheme: Themes.dark,

                ///HOME
                home: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Notes")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.active) {
                      return const ShowDataScreen();
                    }
                    if (!snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.waiting) {
                      return CustomProgressIndicator(
                        textMessage: "Waiting for Connection...",
                      );
                    }
                    if (!snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.none) {
                      return CustomProgressIndicator(
                        textMessage: "No Connection...",
                      );
                    }
                    if (!snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.none &&
                        snapshot.connectionState == ConnectionState.waiting) {
                      return CustomProgressIndicator(
                        textMessage: "Waiting For Response",
                      );
                    } else {
                      return CustomProgressIndicator(
                        textMessage: "Loading...",
                      );
                    }
                  },
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        );
      }),
    );
  }
}
