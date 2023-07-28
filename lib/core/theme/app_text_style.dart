// ignore_for_file: dead_code

import 'package:appsivalmattel/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle(this.context);
  final BuildContext context;

  TextStyle titleAppBar({
    Color color = AppColors.kPrimary,
  }) =>
      Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle normal12({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: color, fontSize: 12.0);

  TextStyle semi12({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: color, fontWeight: FontWeight.w500, fontSize: 12.0);

  TextStyle semi16({Color color = AppColors.grayLight}) => Theme.of(context)
      .textTheme
      .titleMedium!
      .copyWith(color: color, fontWeight: FontWeight.w500, fontSize: 16.0);

  TextStyle bold14({Color? color = AppColors.grayDark, double size = 14.0}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w600, fontSize: size);

  TextStyle bold18({Color? color = Colors.black, double size = 18.0}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w600, fontSize: size);

  TextStyle semi14({Color color = AppColors.grayLight, double size = 14.0}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w500, fontSize: size);

  TextStyle medium14({
    Color color = AppColors.grayLight,
    double size = 14.0,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.w400,
            fontSize: size,
          );

  TextStyle extra20({Color? color = Colors.white}) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 20.0);

  TextStyle extra16({Color? color = Colors.white}) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 16.sp);

  TextStyle bold24({double size = 24.0, Color color = Colors.white}) {
    return Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(color: color, fontWeight: FontWeight.w600, fontSize: 24.0);
  }
}
