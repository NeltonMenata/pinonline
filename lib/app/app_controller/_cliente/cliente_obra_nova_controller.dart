import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_orcamento/orcamento_controller.dart';
import 'package:pinonline/app/app_models/orcamento_model.dart';
import 'package:pinonline/app/app_views/_orcamento/orcamento_view.dart';

import 'cliente_login_controller.dart';

class ClienteObraNovaController extends GetxController {
  static final controller = Get.put(ClienteObraNovaController());
  ClienteLoginController get controllerLogin =>
      ClienteLoginController.controller;
  var descOrcamento = TextEditingController();
  var isDocSelect = false.obs;
  File?doc;

  Future<void> selectFile() async {
    
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["pdf"]);
    if (result == null) return;
    print(result.files.first.path);
    doc = File(result.files.first.path!);
    print(doc);
    isDocSelect.value = true;
  }

  void continuar() {
    if(doc == null || isDocSelect.value != true)
    {
      Get.snackbar("Documento", "Seleciona um documento do tipo PDF");
      return;
    }
    
    Get.to(
      OrcamentoView(),
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
    descOrcamento.text = "";
  }
 @override
  void onInit() {
    
    isDocSelect.value = false;
    super.onInit();
  }
}
