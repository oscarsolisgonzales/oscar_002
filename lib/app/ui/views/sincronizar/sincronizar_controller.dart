import 'package:appsivalmattel/app/data/models/response/response_matteldesabaste_model.dart';
//import 'package:appsivalmattel/app/routes/routes_name.dart';
import 'package:appsivalmattel/app/ui/components/spinner.dart';
import 'package:get/get.dart';
import '../../../data/models/response/response_distribuidora_model.dart';
import '../../../data/models/response/response_puntoventa_model.dart';
import '../../../data/models/response/response_usuario_model.dart';
import '../../../data/providers/distribuidora_provider.dart';
import '../../../data/providers/puntoventa_provider.dart';
import '../../../data/providers/usuario_provider.dart';

class SincronizarController extends GetxController {
  @override
  void onInit() {
    //fetchData();
    super.onInit();
  }

  UsuarioProvider usuarioProvider = UsuarioProvider();
  List<ResponseUsuarioModel> usuarios = [];

  PuntoventaProvider puntoventaProvider = PuntoventaProvider();
  List<ResponsePuntoventaModel> puntoventas = [];

  DistribuidoraProvider distribuidoraProvider = DistribuidoraProvider();
  List<ResponseDistribuidoraModel> distribuidoras = [];

  fetchData() async {
    Spinner.show();
    ResponseUsuarioModel().deleteAll();
    final usuarios = await usuarioProvider.getAllUsuarios();
    for (var usuario in usuarios) {
      //insert en sqlite
      await ResponseUsuarioModel().create(usuario.toMap());
    }

    ResponsePuntoventaModel().deleteAll();
    final puntoventas = await puntoventaProvider.getAllPuntoventas();
    for (var puntoventa in puntoventas) {
      //insert en sqlite
      await ResponsePuntoventaModel().create(puntoventa.toMap());
    }

    ResponseDistribuidoraModel().deleteAll();
    final distribuidoras = await distribuidoraProvider.getAllDistribuidoras();
    for (var distribuidora in distribuidoras) {
      //insert en sqlite
      await ResponseDistribuidoraModel().create(distribuidora.toMap());
    }

    ResponseMatteldesabasteModel().deleteAll();
    Spinner.hide();
    //Get.offNamed(RoutesName.homePage);
  }

  getAllSqlite() async {
    final response = await ResponseUsuarioModel().query("");
    //final response = await ResponseUsuarioModel().query("WHERE id=?", arguments: [76]);
    usuarios = (response as List)
        .map(
          (data) => ResponseUsuarioModel.fromJson(data),
        )
        .toList();

    final response1 = await ResponsePuntoventaModel().query("");
    puntoventas = (response1 as List)
        .map(
          (data) => ResponsePuntoventaModel.fromJson(data),
        )
        .toList();

    final response2 = await ResponseDistribuidoraModel().query("");
    distribuidoras = (response2 as List)
        .map(
          (data) => ResponseDistribuidoraModel.fromJson(data),
        )
        .toList();

    update();
  }
}
