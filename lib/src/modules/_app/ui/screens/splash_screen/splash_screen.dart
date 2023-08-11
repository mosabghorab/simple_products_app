import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/splash_screen/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // controller.
  @override
  void initState() {
    context.read<SplashScreenController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 800))
                  ..forward()),
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.white.withOpacity(0.2),
              child: Text(
                'Logo',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
