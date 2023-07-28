import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService {
  static final _storage = Get.find<FlutterSecureStorage>();

  static Future<void> set({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String> get(String key) async {
    return await _storage.read(key: key) ?? "";
  }
}
