import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_models/obra_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_obra_nova_view.dart';

class ObraSaveController extends GetxController {
  static final controller = Get.put(ObraSaveController());

  static List<ObraModel> obra = [];

  saveDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: ()async=> false,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Pedido de Orçamento"),
                backgroundColor: Colors.green[500],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/img/logo_save.png"),
                    ListTile(
                      title: Text("Pedido de Orçamento enviado"),
                      subtitle: Text(
                          "O seu pedido de orçamento foi enviado com sucesso clique no botão para voltar"),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.green[500], borderRadius: BorderRadius.circular(12)),
                      width: 150,
                      child: TextButton.icon(
                          onPressed: () {
                            ProviderData.obraLista.add(obra[0]);
                            Get.offAll(ClienteObraNovaView());
                          },
                          icon: Icon(Icons.arrow_back_ios_new_outlined),
                          label: Text("Voltar")),
                    ),
                    
                  ],
                ),
              ),
            ),
          );
        });
  }
}
