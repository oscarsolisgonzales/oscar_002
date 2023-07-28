import 'dart:io';

import 'package:appsivalmattel/app/ui/views/desabastecimiento/desabastecimiento_controller.dart';
import 'package:appsivalmattel/app/ui/views/desabastecimiento/widgets/photo_viewer.dart';
import 'package:appsivalmattel/core/theme/app_colors.dart';
import 'package:appsivalmattel/core/theme/app_text_style.dart';
import 'package:appsivalmattel/core/utils/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class AttachFile extends StatelessWidget {
  const AttachFile({
    Key? key,
    required this.numberQuestion,
  }) : super(key: key);

  final int numberQuestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      height: 90.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          BtnAddFile(
            numberQuestion: numberQuestion,
          ),
          ImageFiles(
            numberQuestion: numberQuestion,
          ),
        ],
      ),
    );
  }
}

class BtnAddFile extends GetView<DesabastecimientoController> {
  const BtnAddFile({
    Key? key,
    required this.numberQuestion,
  }) : super(key: key);
  final int numberQuestion;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: 160.h,
            padding: EdgeInsets.only(
              top: 20.h,
              left: kMarginApp.w,
              right: kMarginApp.w,
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
                rowMenu(
                  context,
                  onTap: () {
                    controller.onImageButtonPressed(
                      ImageSource.camera,
                      numberQuestion: numberQuestion,
                    );
                    Get.back();
                  },
                  fileName: "ico_camera.png",
                  text: "Tomar foto",
                ),
                rowMenu(
                  context,
                  onTap: () {
                    Get.back();
                  },
                  fileName: "ico_camera.png",
                  text: "Elegir Galería",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
        );
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(kRadiusMedium.r),
        dashPattern: const [2, 4],
        strokeWidth: 1.5,
        color: AppColors.kSecondary,
        child: Container(
          width: 95.w,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: const Icon(Iconsax.add),
        ),
      ),
    );
  }

  Widget rowMenu(
    BuildContext context, {
    required VoidCallback onTap,
    required String fileName,
    required String text,
    bool showBorder = false,
    bool showArrow = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(
                  bottom: BorderSide(
                    color: AppColors.kLine,
                    width: .3,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            const Icon(
              Iconsax.camera,
              size: 25.0,
              color: Colors.red,
            ),
            SizedBox(width: 10.w),
            Text(
              text,
              style: AppTextStyle(context).extra16(
                color: AppColors.kPrimary,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class ImageFiles extends GetView<DesabastecimientoController> {
  const ImageFiles({
    Key? key,
    required this.numberQuestion,
  }) : super(key: key);

  final int numberQuestion;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 90.h,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          reverse: true,
          children: List.generate(
            controller.getFiles(numberQuestion: numberQuestion).length,
            (index) => GetBuilder<DesabastecimientoController>(
                builder: (_) => Container(
                      width: 95.w,
                      margin: EdgeInsets.only(left: 15.w),
                      height: double.infinity,
                      alignment: Alignment.topRight,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => PhotoViewer(
                                  path: controller
                                      .getFiles(
                                          numberQuestion: numberQuestion)[index]
                                      .path,
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.file(
                                File(
                                  controller
                                      .getFiles(
                                          numberQuestion: numberQuestion)[index]
                                      .path,
                                ),
                                width: 95.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5.0,
                            right: 5.0,
                            child: GestureDetector(
                              onTap: () {
                                controller.removeImage(
                                  numberQuestion: numberQuestion,
                                  index: index,
                                );
                              },
                              child: CircleAvatar(
                                radius: 12.r,
                                backgroundColor: Colors.white70,
                                child: Icon(
                                  Icons.close,
                                  size: 16.sp,
                                  color: AppColors.kSecondary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
