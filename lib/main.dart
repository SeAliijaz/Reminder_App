import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/Constants/enums.dart';
import 'package:reminder_app/Models/menu_info.dart';
import 'package:reminder_app/Reminder/services.dart';
import 'package:reminder_app/Screens/home_screen.dart';

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
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xff272171),
            ),

            ///HOME
            home: ChangeNotifierProvider<MenuInfo>(
              create: (context) => MenuInfo(MenuType.clock),
              child: HomeScreen(),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
