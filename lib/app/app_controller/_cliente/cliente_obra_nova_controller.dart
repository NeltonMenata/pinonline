import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_orcamento/orcamento_controller.dart';
import 'package:pinonline/app/app_models/orcamento_model.dart';
import 'package:pinonline/app/app_views/_orcamento/orcamento_view.dart';

import 'cliente_login_controller.dart';

class ClienteObraNovaController extends GetxController {
  static final controller = Get.put(ClienteObraNovaController());
  final controllerLogin = ClienteLoginController.controller;
  var descOrcamento = TextEditingController();
  void continuar() {
    Get.to(OrcamentoView(),
    /*
        arguments: OrcamentoModel(
            cliente: controllerLogin.cliente[0],
            done: false,
            desc: descOrcamento.text,
            objectId: "objectId"),*/
            );
          OrcamentoController.orcamento.clear();  
          OrcamentoController.orcamento.add(OrcamentoModel(
            cliente: controllerLogin.cliente[0],
            done: false,
            desc: descOrcamento.text,
            objectId: "objectId"));
        descOrcamento.text="";
  }
}
