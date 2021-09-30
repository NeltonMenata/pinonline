import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '/app/app_views/categoria_view/canalizador_view.dart';
// ignore: unused_import
import '/app/app_controller/home_controller.dart';
//import '/app/app_views/teste_widgets.dart';

PreferredSizeWidget appBarMain() {
  return AppBar(
    centerTitle: true,
    title: Text("JustBuild"),
    actions: [

      Image.asset(
        "assets/img/logo1.png",
        width: 70,
      
      ),
      /*IconButton(icon: Icon(Icons.other_houses), onPressed: (){
        Get.to(View());
      })*/
      
    ],
    foregroundColor: Colors.green,
  );
}

get _to => HomeController.controller;

PreferredSizeWidget appBarSearch() {
  return AppBar(
    leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
            Get.back();
            _to.atualizaHome();

          },),
    centerTitle: true,
    title: Text(
      "Resultado da Pesquisa",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    actions: [
      Image.asset(
        "assets/img/logo1.png",
        width: 70,
      )
    ],
    foregroundColor: Colors.green,
  );
}
