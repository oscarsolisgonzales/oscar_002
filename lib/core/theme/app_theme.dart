import 'package:appsivalmattel/core/theme/app_colors.dart';
import 'package:appsivalmattel/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.kBase,
    backgroundColor: AppColors.kBackground,
    scaffoldBackgroundColor: AppColors.kBackground,
    colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.kBase),
    /*  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.kBottonNavigation,
      unselectedItemColor: AppColors.kDisabled,
      selectedItemColor: AppColors.kBase,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 10.0,
      selectedLabelStyle: TextStyle(
        fontSize: 12.0,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.0,
      ),
    ), */
    hintColor: AppColors.kBase,
    brightness: Brightness.light,
    //fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleSpacing: 0,
      centerTitle: true,
      color: AppColors.kBackground,
      iconTheme: IconThemeData(
        color: AppColors.kBase,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusMedium),
        borderSide: const BorderSide(
          width: 1.0,
          color: AppColors.kLine,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusMedium),
        borderSide: const BorderSide(
          width: 1.0,
          color: AppColors.kLine,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusMedium),
        borderSide: const BorderSide(
          width: 1.0,
          color: AppColors.kBase,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusMedium),
        borderSide: const BorderSide(
          width: .6,
          color: AppColors.kRed,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadiusMedium),
        borderSide: const BorderSide(
          width: .6,
          color: AppColors.kRed,
        ),
      ),
      labelStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: AppColors.kSecondary),
      prefixIconColor: AppColors.kBase,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.kBase,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
