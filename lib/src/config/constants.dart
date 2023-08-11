class Constants {
  //||... app name ...||
  static const String appName = "Simple Products App";

//           ||-------------------------------------------||

  //||... shared preferences ...||
  static const String sharedPreferencesAppLang = 'appLang';
  static const String sharedPreferencesAppLangDefaultValue = 'ar';
  static const String sharedPreferencesAppColor = 'appColor';
  static const int sharedPreferencesAppColorDefaultValue = 0xffF1734F;
  static const String sharedPreferencesIsNotificationEnabled =
      'isNotificationsEnabled';
  static const bool sharedPreferencesIsNotificationEnabledDefaultValue = true;
  static const String sharedPreferencesIsDarkModeEnabled = 'isDarkModeEnabled';
  static const bool sharedPreferencesIsDarkModeEnabledDefaultValue = false;
  static const String sharedPreferencesUserData = 'userData';
  static const String sharedPreferencesProducts = 'products';

  //||... shared preferences ...||

//           ||-------------------------------------------||

  //||... api ...||
  // production base url.
  //   static const String baseUrl = 'http://elixir-kombucha.com/';
  // development base url.
  static const String baseUrl = 'https://rette.alialqrinawi.me/';
  static const String apiUrl = '${baseUrl}api/V1/';

  //||... api ...||

//           ||-------------------------------------------||

  //||...  supported locales ...||
  static const Map<String, String> supportedLocales = {
    'ar': 'العربية',
    'en': 'English',
  };

  //||...  supported locales ...||

//           ||-------------------------------------------||

  //||... assets ...||
  static const String assetsImagesPath = 'assets/images/';
  static const String assetsVectorsPath = 'assets/vectors/';
  static const String assetsAnimationsPath = 'assets/animations/';

  //||... assets ...||

  //           ||-------------------------------------------||

  //||... static screens ...||
  // static const String staticPageAboutUs = 'aboutus';
  // static const String staticPageContactUs = 'contactus';
  // static const String staticPagePrivacyPolicy = 'privacy&policies';
  // static const String staticPageTermsOfUse = 'termsOfUse';
  //||... static screens ...||

  //           ||-------------------------------------------||

  //||... local notifications ...||
  // static const String firebasePushNotificationsTopic = 'ssss';
  // static const String androidNotificationChannelId = 'ssssId';
  // static const String androidNotificationChannelName = 'ssss';
  //||... local notifications ...||

  //           ||-------------------------------------------||

  //||... pusher ...||
  // static const String pusherApiKey = 'rewrewrw6be9bafe93bab';
  // static const String pusherCluster = 'ap2';
  // static const String pusherAppId = '9878453';
  // static const String pusherAppSecret = 'bewwgf347a31d4db0317c';
  // static const String pusherChannelNameChat = 'new-message-for-chat-';
  // static const String pusherEventNewMessage = 'new-message';
  //||... pusher ...||
}
