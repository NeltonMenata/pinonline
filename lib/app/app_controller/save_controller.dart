import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_models/categorias_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
//import 'package:pinonline/app/app_provider/provider_data.dart';

class SaveController extends GetxController {
  static final controller = Get.put(SaveController());
  //final _categoria = ProviderData.categoriaAll;

  TextEditingController nome = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController desc = TextEditingController();

  saveCategorie(Categoria value) async {
    ProviderData.categoriaAll.add(value);
    try {
      Get.snackbar("Salvando", "Aguarde", showProgressIndicator: true,);
      final todo = ParseObject("Categoria");
      todo
        ..set("nome", value.nome)
        ..set("urlImage", value.url)
        ..set("descricao", value.desc)
        ..set("selected", value.selected);

      ParseResponse response = await todo.save();

      if(response.statusCode == 201 && response.success){
        Get.snackbar("Sucesso", "Dados salvos com sucesso",);
      }else{
        Get.snackbar("Erro", "Dados não foram salvos, tente novamente!",);
      }
        
      nome.text = "";
      url.text = "";
      desc.text = "";
    } catch (e) {
      nome.text = "Erro ao conectar: ${e.toString()}";
    }

    update();
  }
}
