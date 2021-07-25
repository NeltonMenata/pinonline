import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/app_controller/home_controller.dart';

PreferredSizeWidget appBarMain() {
  return AppBar(
    centerTitle: true,
    title: Text("JustBuild"),
    actions: [
      Image.asset(
        "assets/img/logo.png",
        width: 70,
      )
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
        "assets/img/logo.png",
        width: 70,
      )
    ],
    foregroundColor: Colors.green,
  );
}
