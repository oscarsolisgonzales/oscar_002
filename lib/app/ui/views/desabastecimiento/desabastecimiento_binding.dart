import 'package:appsivalmattel/app/ui/views/desabastecimiento/desabastecimiento_controller.dart';
import 'package:get/get.dart';

class DesabastecimientoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DesabastecimientoController());
  }
}
