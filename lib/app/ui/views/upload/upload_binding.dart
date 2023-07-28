import 'package:appsivalmattel/app/ui/views/upload/upload_controller.dart';
import 'package:get/get.dart';

class UploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadController());
  }
}
