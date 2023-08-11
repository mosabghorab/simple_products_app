import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_products_app/src/managers/navigation_manager.dart';
import 'package:simple_products_app/src/managers/shared_preferences_manager.dart';
import 'package:timeago/timeago.dart';

class StartUp {
  // init before app building.
  static Future<void> initBeforeAppBuilding() async {
    // this is for status bar color.
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent, //Color for Android
          statusBarBrightness:
          Brightness.light //Dark == white status bar -- for IOS.
      ),
    );

    // init shared preferences manager.
    await SharedPreferencesManager.init();

    // init navigation manager.
    N.init();
  }

  // init after app building.
  static Future<void> initAfterAppBuilding() async {
    // init firebase.
    // await Firebase.initializeApp();

    // init futures.
    await Future.wait([
      // init local notifications manager.
      // LocalNotificationsManager.instance.init(),

      // init firebase messaging manager.
      // FirebaseMessagingManager.instance.init(),

      // init dynamic links manager.
      // DynamicLinksService.instance.init(),

      // init pusher manager.
      // PusherManager.instance.init(),
    ]);

    // init time ago.
    setLocaleMessages('en', EnMessages());
    setLocaleMessages('ar', ArMessages());
    if (SharedPreferencesManager.instance.getAppLang() != null) {
      setDefaultLocale(SharedPreferencesManager.instance.getAppLang()!);
    }
  }
}
