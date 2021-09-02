import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_models/obra_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_obra_nova_view.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_welcome_view.dart';

class ObraSaveController extends GetxController {
  static final controller = Get.put(ObraSaveController());

  static List<ObraModel> obra = [];

  saveDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enviar pedido de Obra"),
            content: Text("Quer voltar na página de Boas-Vindas?"),
            actions: [
              TextButton(
                  child: Text("Sim"),
                  onPressed: () {
                    ProviderData.obraLista.add(obra[0]);
                    Get.offAll(ClienteWelcomeView());
                  }),
              TextButton(child: Text("Não"), onPressed: () {
                Get.offAll(ClienteObraNovaView());
              }),
            ],
          );
        });
  }
}
