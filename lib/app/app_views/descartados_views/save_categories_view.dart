import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/home_controller.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';
import 'package:pinonline/app/app_views/app_components/save_components/save_form.dart';
import '/app/app_controller/save_controller.dart';
import '/app/app_models/categorias_model.dart';

class SaveCategorieView extends StatelessWidget {
  SaveController get _upsaveController => SaveController.controller;
  HomeController get _to => HomeController.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
              _to.atualizaHome();
            },
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  if (formSave.currentState!.validate()) {
                    _upsaveController.saveCategorie(
                      Categoria(
                        nome: _upsaveController.nome.text,
                        desc: _upsaveController.nome.text,
                        url: _upsaveController.url.text,
                        selected: false,
                        id: Random().nextInt(1 << 32),
                      ),
                    );
                  }
                })
          ],
        ),
        body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue, Colors.white])),
              child: FormSave()),
        ),
        bottomNavigationBar: bottomAppBarOthers());
  }
}
