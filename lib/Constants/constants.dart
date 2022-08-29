import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///Making Global Toast
void showToastMsg(String msg) {
  Fluttertoast.showToast(msg: msg);
}

const myDivider = Divider(color: Colors.black12, thickness: 1);

///global navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Color scaffoldBgColor = const Color(0xff1c2757);
