import 'package:appsivalmattel/core/theme/app_text_style.dart';
import 'package:appsivalmattel/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterForm extends StatelessWidget {
  const FooterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: kMarginLargeApp.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Versión: 1.0.0",
            style: AppTextStyle(context).medium14(size: 15),
          ),
        ],
      ),
    );
  }
}
