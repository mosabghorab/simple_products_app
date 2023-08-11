
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_products_app/src/config/constants.dart';
import 'package:simple_products_app/src/config/localization/app_localization.dart';
import 'package:simple_products_app/src/config/shared_data.dart';
import 'package:simple_products_app/src/config/theming/app_theme.dart';
import 'package:simple_products_app/src/managers/shared_preferences_manager.dart';
import 'package:simple_products_app/src/modules/_app/app_router.dart';
import 'package:provider/provider.dart';

import 'app_widget_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AppWidgetController, bool>(
      selector: (_, value) => value.nApp,
      builder: (_, nApp, __) => ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          theme: AppTheme.lightTheme(),
          // darkTheme: AppTheme.darkTheme(),
          // themeMode: SharedPreferencesManager.instance.isDarkModeEnabled()
          //     ? ThemeMode.dark
          //     : ThemeMode.light,
          locale: Locale(
            SharedPreferencesManager.instance.getAppLang() ??
                Constants.sharedPreferencesAppLangDefaultValue,
          ),
          builder: DevicePreview.appBuilder,
          supportedLocales:
              Constants.supportedLocales.keys.map((e) => Locale(e)),
          navigatorKey: SharedData.navigationKey,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: Constants.appName,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.splashScreen,
        ),
      ),
    );
  }
}
