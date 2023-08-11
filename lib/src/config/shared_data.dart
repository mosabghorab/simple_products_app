import 'package:flutter/material.dart';
import 'package:simple_products_app/src/config/core/enums.dart';
import 'package:simple_products_app/src/config/localization/app_localization.dart';

class SharedData {
  //||... current_user ...||
  // static User? currentUser;

  //||... app opened by ...||
  static AppOpenedBy appOpenedBy = AppOpenedBy.user;

  //||... navigation key ...||
  static GlobalKey<NavigatorState>? navigationKey;

  //||... localization ...||
  static late AppLocalizations appLocalization;
}
