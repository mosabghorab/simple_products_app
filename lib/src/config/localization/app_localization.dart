import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_products_app/src/config/constants.dart';
import 'package:simple_products_app/src/config/shared_data.dart';

import 'langs/ar.dart';
import 'langs/en.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      Constants.supportedLocales.keys.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  AppLocalizations(this.locale) {
    SharedData.appLocalization = this;
    load();
  }

  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  //||... translated values ...||
  Map<String, String>? _localizedValues;

  //||... load new language ...||
  void load() {
    switch (locale.languageCode) {
      case 'ar':
        _localizedValues = ar;
        break;
      case 'en':
        _localizedValues = en;
        break;
    }
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  //||... get translated value ...||
  String? translate(String key) {
    return _localizedValues![key];
  }
}
