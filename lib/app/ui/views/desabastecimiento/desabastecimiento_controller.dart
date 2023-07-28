import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:appsivalmattel/app/data/models/resquest/request_matteldesabaste_model.dart';
import 'package:appsivalmattel/app/routes/routes_name.dart';
import 'package:appsivalmattel/app/services/storage/storage_service.dart';
import 'package:appsivalmattel/core/utils/keys.dart';
import 'package:appsivalmattel/core/utils/popup_messages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class DesabastecimientoController extends GetxController {
  //Instance
  @override
  void onInit() {
    inicialize();
    super.onInit();
  }

  //Variables
  RxString userNombre = RxString("");
  String userID = "0";
  String puntoventa = "";

  RxList<File> imageFileList1 = RxList([]);
  RxList<File> imageFileList2 = RxList([]);
  RxList<File> imageFileList3 = RxList([]);
  RxList<File> imageFileList4 = RxList([]);
  RxList<File> imageFileList5 = RxList([]);
  RxList<File> imageFileList6 = RxList([]);
  RxList<File> imageFileList7 = RxList([]);
  RxList<File> imageFileList8 = RxList([]);
  RxList<File> imageFileList9 = RxList([]);

  RxString pathImage = RxString("");
  //Functions
  inicialize() async {
    userNombre.value = await StorageService.get(Keys.keyUserNombre);
    //userID = int.parse(await StorageService.get(Keys.keyUserId));
    userID = await StorageService.get(Keys.keyUserId);
  }

  Future<File> changeFileName(
    XFile pickedFile,
    String newFileName,
  ) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String newPath = path.join(
      dir,
      'jpg_$newFileName${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}_${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}.jpeg',
    );
    return File(pickedFile.path).copy(newPath);
  }

  void onImageButtonPressed(
    ImageSource source, {
    required int numberQuestion,
    bool isMultiImage = false,
  }) async {
    try {
      ImagePicker picker = ImagePicker();
      final totalImages =
          getFiles(numberQuestion: numberQuestion).length; // Por validar
      final XFile? pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 50,
      );
      if (pickedFile != null && totalImages < 2) {
        switch (numberQuestion) {
          case 1:
            imageFileList1.add(await changeFileName(pickedFile, puntoventa));
            break;
          case 2:
            imageFileList2.add(await changeFileName(pickedFile, puntoventa));
            break;
          case 3:
            imageFileList3.add(await changeFileName(pickedFile, puntoventa));
            break;
          case 4:
            imageFileList4.add(await changeFileName(pickedFile, puntoventa));
            break;
          case 5:
            imageFileList5.add(await changeFileName(pickedFile, puntoventa));
            break;
          case 6:
            imageFileList6.add(await changeFileName(pickedFile, puntoventa));
            break;
          case 7:
            imageFileList7.add(await changeFileName(pickedFile, puntoventa));
            break;
          case 8:
            imageFileList8.add(await changeFileName(pickedFile, puntoventa));
            break;
          case 9:
            imageFileList9.add(await changeFileName(pickedFile, puntoventa));
            break;
        }
        update();
      } else {
        PopUpMessages.show(
          "Por favor seleccionar solo 2 imagenes",
          title: "Galeria",
        );
      }
    } catch (error) {
      PopUpMessages.show(
        "Por favor seleccione nuevamente los archivos que desea adjuntar, $error",
        title: "Error al adjuntar archivo",
      );
    }
  }

  RxList<File> getFiles({
    required int numberQuestion,
  }) {
    switch (numberQuestion) {
      case 1:
        return imageFileList1;
      case 2:
        return imageFileList2;
      case 3:
        return imageFileList3;
      case 4:
        return imageFileList4;
      case 5:
        return imageFileList5;
      case 6:
        return imageFileList6;
      case 7:
        return imageFileList7;
      case 8:
        return imageFileList8;
      case 9:
        return imageFileList9;
      default:
        return imageFileList1;
    }
  }

  void removeImage({
    required int numberQuestion,
    required int index,
  }) {
    switch (numberQuestion) {
      case 1:
        imageFileList1.removeAt(index);
        break;
      case 2:
        imageFileList2.removeAt(index);
        break;
      case 3:
        imageFileList3.removeAt(index);
        break;
      case 4:
        imageFileList4.removeAt(index);
        break;
      case 5:
        imageFileList5.removeAt(index);
        break;
      case 6:
        imageFileList6.removeAt(index);
        break;
      case 7:
        imageFileList7.removeAt(index);
        break;
      case 8:
        imageFileList8.removeAt(index);
        break;
      case 9:
        imageFileList9.removeAt(index);
        break;
    }
  }

  //Guardar
  doSave(
    String puntoventaId,
    String puntoventa,
    String fechaSupervision,
    String p01,
    String p02,
    String p03,
    String p04,
    String p05,
    String p06,
    String p07,
    String p08,
    String p09,
    String comentario,
    String latitud,
    String longitud,
  ) async {
    try {
      //1.- Armar el modelo
      RequestMatteldesabasteModel oRequest = RequestMatteldesabasteModel(
        usuarioId: userID,
        puntoventaId: puntoventaId,
        puntoventa: puntoventa,
        fecha: fechaSupervision,
        p01: p01,
        p02: p02,
        p03: p03,
        p04: p04,
        p05: p05,
        p06: p06,
        p07: p07,
        p08: p08,
        p09: p09,
        f01: imageFileList1.isNotEmpty ? imageFileList1[0].path : "",
        f02: imageFileList2.isNotEmpty ? imageFileList2[0].path : "",
        f03: imageFileList3.isNotEmpty ? imageFileList3[0].path : "",
        f04: imageFileList4.isNotEmpty ? imageFileList4[0].path : "",
        f05: imageFileList5.isNotEmpty ? imageFileList5[0].path : "",
        f06: imageFileList6.isNotEmpty ? imageFileList6[0].path : "",
        f07: imageFileList7.isNotEmpty ? imageFileList7[0].path : "",
        f08: imageFileList8.isNotEmpty ? imageFileList8[0].path : "",
        f09: imageFileList9.isNotEmpty ? imageFileList9[0].path : "",
        f011: imageFileList1.length > 1 ? imageFileList1[1].path : "",
        f021: imageFileList2.length > 1 ? imageFileList2[1].path : "",
        f031: imageFileList3.length > 1 ? imageFileList3[1].path : "",
        f041: imageFileList4.length > 1 ? imageFileList4[1].path : "",
        f051: imageFileList5.length > 1 ? imageFileList5[1].path : "",
        f061: imageFileList6.length > 1 ? imageFileList6[1].path : "",
        f071: imageFileList7.length > 1 ? imageFileList7[1].path : "",
        f081: imageFileList8.length > 1 ? imageFileList8[1].path : "",
        f091: imageFileList9.length > 1 ? imageFileList9[1].path : "",
        comentario: comentario,
        supfecha: DateTime.now().toString(),
        suplatitud: latitud,
        suplongitud: longitud,
      );

      //2.- Guardar
      await RequestMatteldesabasteModel().create(oRequest.toMap());

      //Consultamos si guardo
      //final response = await ResponseMatteldesabasteModel().query("");
      print("object");
      Get.offNamed(RoutesName.homePage);
    } catch (error) {
      print("Errores: $error");
    }
  }
}
