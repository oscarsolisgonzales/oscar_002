import 'package:appsivalmattel/app/data/providers/usuario_provider.dart';
import 'package:appsivalmattel/app/routes/routes_name.dart';
import 'package:appsivalmattel/app/services/storage/storage_service.dart';
import 'package:appsivalmattel/core/utils/keys.dart';
import 'package:appsivalmattel/core/utils/popup_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/response/response_usuario_model.dart';

class LoginController extends GetxController {
  //Instance
  @override
  void onInit() {
    inicialize();
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  //Variables

  UsuarioProvider usuarioProvider = UsuarioProvider();
  List<ResponseUsuarioModel> usuarios = [];

  String txtemail = "";
  String txtpassword = "";
  int cantidad = 0;
  String userMail = "";

  RxBool isLoading = RxBool(false);
  RxBool isObscureText = RxBool(true);
  RxString existsSession = RxString("");
  RxString errorTextEmail = RxString("");
  RxString errorTextPassword = RxString("");

  //TextEditingController
  TextEditingController textCtrlEmail = TextEditingController();
  TextEditingController textCtrlPassword = TextEditingController();

  //Functions
  inicialize() async {
    txtemail = await StorageService.get(Keys.keyUserEmail);
    textCtrlEmail.text = "mattel@consorciolp.com.pe";
    textCtrlPassword.text = "12345";
  }

  goToHome() {
    Get.offNamed(RoutesName.homePage);
  }

  goToSincronizar() {
    Get.toNamed(RoutesName.sincronizarPage);
  }

  void showPassword() {
    isObscureText.value = !isObscureText.value;
  }

  doAuthentication() async {
    try {
      bool validateEmail = GetUtils.isEmail(textCtrlEmail.text.trim());
      bool validatePassword = textCtrlPassword.text.isNotEmpty;

      errorTextEmail.value = validateEmail ? "" : 'Ingrese un correo válido';
      errorTextPassword.value = validatePassword ? "" : 'Ingrese su contraseña';

      if (validateEmail && validatePassword) {
        isLoading.value = true;

        //Buscar información en tabla local
        final response = await ResponseUsuarioModel()
            .query("WHERE email=? AND password=?", arguments: [
          textCtrlEmail.text,
          textCtrlPassword.text,
        ]);

        usuarios = (response as List)
            .map(
              (data) => ResponseUsuarioModel.fromJson(data),
            )
            .toList();

        cantidad = usuarios.length;

        if (cantidad > 0) {
          await StorageService.set(
            key: Keys.keyUserId,
            value: usuarios[0].id.toString(),
          );
          await StorageService.set(
            key: Keys.keyUserNombre,
            value: usuarios[0].nombre,
          );
          await StorageService.set(
            key: Keys.keyUserEmail,
            value: usuarios[0].email,
          );
          isLoading.value = false;
          Get.offNamed(RoutesName.homePage);
        } else {
          isLoading.value = false;
          PopUpMessages.show(
            "Por favor verifique su usuario y contraseña",
            title: "Error en autenticación",
          );
        }
      }
    } catch (error) {
      isLoading.value = false;
    }

    /*  final response = await ResponseUsuarioModel().query(
        "WHERE email=? AND password=?",
        arguments: [txtemail, txtpassword]);

    usuarios = (response as List)
        .map(
          (data) => ResponseUsuarioModel.fromJson(data),
        )
        .toList();

    cantidad = usuarios.length;

    if (cantidad > 0) {
      await StorageService.set(
        key: Keys.keyUserId,
        value: usuarios[0].id.toString(),
      );
      await StorageService.set(
        key: Keys.keyUserNombre,
        value: usuarios[0].nombre,
      );
      await StorageService.set(
        key: Keys.keyUserEmail,
        value: usuarios[0].email,
      );
      goToHome();
    } else {
      Get.snackbar(
        "Error en Autenticación",
        "Usuario o Password mal ingresados... por Favor Verificar",
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.error_outline),
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        duration: const Duration(seconds: 4),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
        showProgressIndicator: true,
      );
    } */
  }
}
