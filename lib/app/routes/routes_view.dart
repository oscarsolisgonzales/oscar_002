import 'package:appsivalmattel/app/routes/routes_name.dart';
import 'package:appsivalmattel/app/ui/views/login/login_binding.dart';
import 'package:appsivalmattel/app/ui/views/home/home_binding.dart';
import 'package:appsivalmattel/app/ui/views/home/home_view.dart';
import 'package:appsivalmattel/app/ui/views/login/login_view.dart';
import 'package:appsivalmattel/app/ui/views/sincronizar/sincronizar_binding.dart';
import 'package:appsivalmattel/app/ui/views/sincronizar/sincronizar_view.dart';
import 'package:appsivalmattel/app/ui/views/upload/upload_binding.dart';
import 'package:appsivalmattel/app/ui/views/upload/upload_view.dart';
import 'package:get/get.dart';

abstract class RoutesView {
  static final views = [
    GetPage(
      name: RoutesName.loginPage,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesName.homePage,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.sincronizarPage,
      page: () => const SincronizarView(),
      binding: SincronizarBinding(),
    ),
    GetPage(
      name: RoutesName.upload,
      page: () => const UploadView(),
      binding: UploadBinding(),
    ),
  ];
}
