import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/add_product_screen/add_product_screen.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/add_product_screen/add_product_screen_controller.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/home_screen/home_screen.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/home_screen/home_screen_controller.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/splash_screen/splash_screen_controller.dart';

class AppRouter {
  static const String splashScreen = '/app-SplashScreen';
  static const String homeScreen = '/app-HomeScreen';
  static const String addProductScreen = '/app-AddProductScreen';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final String screenName = settings.name!;
    late final dynamic screenArgs = settings.arguments;
    if (screenName.startsWith('/app-')) {
      return router(screenName: screenName, args: screenArgs);
    } else {
      return MaterialPageRoute(
        builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('route not found'),
            ),
          );
        },
      );
    }
  }

  // router.
  static Route<dynamic> router({
    required String screenName,
    required dynamic args,
  }) {
    if (screenName == splashScreen) {
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<SplashScreenController>(
          create: (_) => SplashScreenController(context: _),
          child: const SplashScreen(),
        ),
      );
    } else if (screenName == homeScreen) {
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<HomeScreenController>(
          create: (_) => HomeScreenController(),
          child: const HomeScreen(),
        ),
      );
    } else if (screenName == addProductScreen) {
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<AddProductScreenController>(
          create: (_) => AddProductScreenController(),
          child: const AddProductScreen(),
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('app route not found'),
            ),
          );
        },
      );
    }
  }
}
