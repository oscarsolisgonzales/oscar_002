import 'package:appsivalmattel/app/services/storage/storage_service.dart';
import 'package:appsivalmattel/core/utils/keys.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Instance
  @override
  void onInit() {
    inicialize();
    super.onInit();
  }

  //Variables
  RxString userNombre = RxString("");
  int userID = 0;

  //Functions
  inicialize() async {
    userNombre.value = await StorageService.get(Keys.keyUserNombre);
    userID = int.parse(await StorageService.get(Keys.keyUserId));
  }
}
