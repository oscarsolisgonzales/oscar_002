import 'package:appsivalmattel/app/ui/components/btn_prymary.dart';
import 'package:appsivalmattel/app/ui/components/input_text.dart';
import 'package:appsivalmattel/app/ui/views/login/login_controller.dart';
import 'package:appsivalmattel/core/theme/app_colors.dart';
import 'package:appsivalmattel/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 60.h),
          padding: EdgeInsets.symmetric(
            horizontal: kMarginLargeApp.w,
          ),
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => controller.existsSession.isEmpty
                    ? InputText(
                        controller: controller.textCtrlEmail,
                        border: InputBorder.none,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 50,
                        labelText: "Correo electrónico",
                        filled: false,
                        fontColor: AppColors.kPrimary,
                        errorText: controller.errorTextEmail.value == ""
                            ? null
                            : controller.errorTextEmail.value,
                        onChanged: (value) =>
                            controller.errorTextEmail.value = "",
                      )
                    : GestureDetector(
                        onTap: null, //controller.removeSession,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.existsSession.value,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 10.h),
                            const Text(
                              "Cambiar usuario",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
              ),
              SizedBox(height: 20.h),
              Obx(
                () => InputText(
                  controller: controller.textCtrlPassword,
                  labelText: "Contraseña",
                  border: InputBorder.none,
                  keyboardType: TextInputType.text,
                  obscureText: controller.isObscureText.value,
                  maxLength: 30,
                  maxLines: 1,
                  filled: false,
                  fontColor: AppColors.kPrimary,
                  suffixIcon: GestureDetector(
                    onTap: controller.showPassword,
                    child: controller.isObscureText.value
                        ? const Icon(
                            Icons.visibility_off_rounded,
                            color: AppColors.kSecondary,
                          )
                        : const Icon(Icons.visibility),
                  ),
                  errorText: controller.errorTextPassword.value == ""
                      ? null
                      : controller.errorTextPassword.value,
                  onChanged: (value) => controller.errorTextPassword.value = "",
                ),
              ),
              SizedBox(height: 40.h),
              Obx(
                () => BtnPrimary(
                  isLoading: controller.isLoading.value,
                  text: "Ingresar",
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          controller.doAuthentication();
                        },
                ),
              ),
              SizedBox(height: 20.h),
              Obx(
                () => BtnPrimary(
                  isLoading: controller.isLoading.value,
                  text: "Sincronizar",
                  isOutline: true,
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          controller.goToSincronizar();
                        },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
