import 'package:appsivalmattel/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Spinner {
  static void show() {
    Get.dialog(
      AlertDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusMedium.r),
        ),
        contentPadding: const EdgeInsets.all(100.0),
        content: Container(
          width: ScreenUtil().setWidth(80),
          height: ScreenUtil().setWidth(80),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kRadiusMedium.r),
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    Get.back();
  }
}
