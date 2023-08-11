import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/app_widget/app_widget.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/app_widget/app_widget_controller.dart';
import 'package:simple_products_app/src/start_up.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StartUp.initBeforeAppBuilding();
  // for previewing the app on multi screen sizes.
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => ChangeNotifierProvider<AppWidgetController>(
        create: (_) => AppWidgetController(),
        child: const AppWidget(),
      ),
    ),
  );
}
