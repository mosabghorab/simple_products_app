import 'package:flutter/cupertino.dart';
import 'package:simple_products_app/src/managers/navigation_manager.dart';
import 'package:simple_products_app/src/modules/_app/app_router.dart';
import 'package:simple_products_app/src/start_up.dart';

class SplashScreenController with ChangeNotifier {
  // constructor fields.

  final BuildContext context;

  // constructor.
  SplashScreenController({
    required this.context,
  }) {
    init();
  }

  // init.
  void init() async {
    await StartUp.initAfterAppBuilding();
    Future.delayed(const Duration(seconds: 2), () async {
      N.offAllNamed(AppRouter.homeScreen);
    });
  }
}
