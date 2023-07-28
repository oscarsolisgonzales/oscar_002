import 'package:appsivalmattel/app/ui/components/btn_prymary.dart';
import 'package:appsivalmattel/app/ui/components/templates/custom_scaffold_base.dart';
import 'package:appsivalmattel/app/ui/views/upload/upload_controller.dart';
import 'package:appsivalmattel/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadView extends StatelessWidget {
  const UploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadController>(
      init: UploadController(),
      builder: (controller) => CustomScaffoldBase(
        titleAppBar: "Subir información",
        body: Container(
          padding: EdgeInsets.only(
            left: kMarginApp.w,
            right: kMarginApp.w,
            top: kMarginApp.w,
          ),
          //child: Center(
          child: BtnPrimary(
            text: "Subir información",
            onPressed: controller.doSave,
          ),
          //),
        ),
      ),
    );
  }
}
