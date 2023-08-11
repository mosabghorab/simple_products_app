// import 'package:flutter/material.dart';
// import 'package:simple_products_app/src/managers/shared_preferences_manager.dart';
// import 'package:simple_products_app/src/modules/_app/ui/widgets/app_widget/app_widget_controller.dart';
//
// class ChangeLanguageWidgetController with ChangeNotifier {
//   // notifiable.
//   String _selectedAppLanguage = SharedPreferencesManager.instance.getAppLang()!;
//
//   String get selectedAppLanguage => _selectedAppLanguage;
//
//   set selectedAppLanguage(String value) {
//     _selectedAppLanguage = value;
//     update(['selectedAppLanguage']);
//   }
//
//   // constructor fields.
//   final BuildContext context;
//
//   // controllers.
//   late final AppWidgetController _appWidgetController =
//       Get.find<AppWidgetController>();
//
//   // constructor.
//   ChangeLanguageWidgetController({
//     required this.context,
//   });
//
//   // on save button tapped.
//   void onSaveButtonTapped() async {
//     Get.back();
//     SharedPreferencesManager.instance.setAppLang(selectedAppLanguage);
//     // setDefaultLocale(selectedAppLanguage);
//     _appWidgetController.notifyApp();
//   }
// }
