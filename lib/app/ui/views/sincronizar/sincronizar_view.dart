import 'package:appsivalmattel/app/ui/components/templates/custom_scaffold_base.dart';
import 'package:appsivalmattel/app/ui/views/sincronizar/sincronizar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SincronizarView extends StatelessWidget {
  const SincronizarView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SincronizarController>(
      init: SincronizarController(),
      builder: (controller) {
        return CustomScaffoldBase(
          titleAppBar: "Sincronizar",
          body: ListView(
            padding: const EdgeInsets.all(20),
            //.symmetric(horizontal: 10, vertical: 30),
            children: [
              MaterialButton(
                onPressed: () {
                  controller.fetchData();
                },
                minWidth: 170.0,
                height: 30.0,
                color: Theme.of(context).primaryColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sincronizar",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.cloud_download,
                          color: Colors.white, size: 24.0),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.business_sharp,
                  size: 40.0,
                  color: Colors.red,
                ),
                title: const Text("Distribuidoras"),
                subtitle: const Text("Listar"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  //_distribuidoras(context, distribuidoras);
                },
              ),
              const SizedBox(height: 15.0),
              ListTile(
                leading: const Icon(
                  Icons.storefront,
                  size: 40.0,
                  color: Colors.red,
                ),
                title: const Text("Punto Supervisión"),
                subtitle: const Text("Listar"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  //_puntoventas(context, puntoventas);
                },
              ),
              const SizedBox(height: 15.0),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  size: 40.0,
                  color: Colors.red,
                ),
                title: const Text("Usuario"),
                subtitle: const Text("Listar"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  //_puntoventas(context, puntoventas);
                },
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        );
      },
    );
  }
}
