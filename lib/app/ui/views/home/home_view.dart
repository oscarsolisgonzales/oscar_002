import 'package:appsivalmattel/app/ui/views/desabastecimiento/desabastecimiento_view.dart';
import 'package:appsivalmattel/app/ui/views/home/home_controller.dart';
import 'package:appsivalmattel/app/ui/views/sincronizar/sincronizar_view.dart';
import 'package:appsivalmattel/app/ui/views/upload/upload_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/fondo.png",
                ),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                    //decoration: const BoxDecoration(color: Colors.red),
                    //padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage("assets/avatar1.png"),
                        ),
                        const SizedBox(height: 10.0),
                        Obx(
                          () => Text(
                            "${controller.userNombre}",
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Mattel",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red.shade50,
                      child: Column(
                        children: [
                          menuOpt(context,
                              view: const SincronizarView(),
                              menuText: "Sincronizar",
                              leadingIcon: Icons.download,
                              trailingIcon: Icons.arrow_forward_ios),
                          menuOpt(context,
                              view: const DesabastecimientoView(),
                              menuText: "Desabastecimiento",
                              leadingIcon: Icons.assignment_add,
                              trailingIcon: Icons.arrow_forward_ios),
                          menuOpt(context,
                              view: const UploadView(),
                              menuText: "Subir",
                              leadingIcon: Icons.upload,
                              trailingIcon: Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text("Home"),
            ),
          ),
        );
      },
    );
  }

  Widget menuOpt(
    BuildContext context, {
    required Widget view,
    required String menuText,
    required IconData leadingIcon,
    required IconData trailingIcon,
  }) {
    return ListTile(
      onTap: () {
        /*  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => view,
          ),
        ); */
        Get.to(() => view);
      },
      title: Text(menuText, textScaleFactor: 1.0),
      leading: Icon(
        leadingIcon,
        size: 30.0,
        color: Colors.red,
      ),
      trailing: Icon(
        trailingIcon,
        size: 20.0,
        color: Colors.blue,
      ),
    );
  }
}
