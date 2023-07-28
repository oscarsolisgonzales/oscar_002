import 'dart:convert';
import 'package:appsivalmattel/core/theme/app_text_style.dart';
import 'package:appsivalmattel/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Helpers {
  static Future<dynamic> loadJsonAssets(String fileName) async {
    final response = await rootBundle.loadString("assets/json/$fileName");
    return json.decode(response);
  }

  static String getFormatedDate(
    String? date, {
    String locale = "es",
    bool showTime = false,
  }) {
    if (date == null || date.isEmpty) return "-";

    var inputFormat = locale == "es"
        ? DateFormat('yyyy-MM-dd')
        : DateFormat('dd/MM/yyyy hh:mm');
    var inputDate = inputFormat.parse(date); // ?? DateTime.now().toString()
    var outputFormat = locale == "es"
        ? showTime == true
            ? DateFormat('dd/MM/yyyy hh:mm')
            : DateFormat('dd/MM/yyyy')
        : DateFormat('yyyy-MM-dd hh:mm');
    return outputFormat.format(inputDate);
  }

  static Future<void> getShowModalBS(
    BuildContext context, {
    required Widget content,
  }) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50.w,
                  height: 10.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kRadiusLarge.r),
                      topRight: Radius.circular(kRadiusLarge.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Seleccione",
                          style: AppTextStyle(context).bold18(),
                        ),
                      ),
                      content,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
