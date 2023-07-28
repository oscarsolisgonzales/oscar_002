import 'package:appsivalmattel/app/routes/routes_name.dart';
import 'package:appsivalmattel/app/routes/routes_view.dart';
import 'package:appsivalmattel/core/theme/app_theme.dart';
import 'package:appsivalmattel/core/utils/injection_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  InjectionDependency.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Sival - Mattel',
        theme: lightTheme(context),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),
        initialRoute: RoutesName.loginPage,
        getPages: RoutesView.views,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: GlowRemover(),
            child: child!,
          );
        },
      ),
    );
  }
}

/// Remueve la burbuja al hacer scroll
class GlowRemover extends ScrollBehavior {
  @override
  Widget buildViewportChrome(context, child, axisDirection) {
    const GlowingOverscrollIndicator(
      color: Colors.transparent,
      axisDirection: AxisDirection.up,
    );
    return child;
  }
}
