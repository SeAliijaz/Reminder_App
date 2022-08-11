import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reminder_app/Reminder/reminder_page.dart';
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
        return FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("something went wrong");
              Fluttertoast.showToast(msg: "something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Reminder app',
                theme: Themes.light,
                themeMode: ThemeServices().theme,
                darkTheme: Themes.dark,
                home: ReminderPage(),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        );
      }),
    );
  }
}
