import 'package:flutter/cupertino.dart';
import 'package:reminder_app/Constants/enums.dart';

class MenuInfo extends ChangeNotifier {
  MenuType? menuType;
  String? title;
  String? imageSource;

  MenuInfo(
    this.menuType, {
    this.title,
    this.imageSource,
  });

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}
