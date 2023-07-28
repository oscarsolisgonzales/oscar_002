import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class InjectionDependency {
  static initialize() {
    //Storage
    Get.lazyPut<FlutterSecureStorage>(() => const FlutterSecureStorage());

    //Providers

    //Repositories
  }
}
