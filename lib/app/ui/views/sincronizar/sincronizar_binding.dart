import 'package:appsivalmattel/app/ui/views/sincronizar/sincronizar_controller.dart';
import 'package:get/get.dart';

class SincronizarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SincronizarController());
  }
}
