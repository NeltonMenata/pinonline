import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_models/categorias_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
//import 'package:pinonline/app/app_provider/provider_data.dart';

class SaveController extends GetxController{

  static final controller = Get.put(SaveController());
  //final _categoria = ProviderData.categoriaAll;
  
  TextEditingController nome = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController desc = TextEditingController();

  saveCategorie(Categoria value){
    
    ProviderData.categoriaAll.add(value);

    nome.text = "";
    url.text = "";
    desc.text = "";

    update();
  }

}