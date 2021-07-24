import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller.dart/save_controller.dart';
import 'package:pinonline/app/app_models/categorias_model.dart';
import 'app_components/home_components/app_bottom_bar.dart';
import 'app_components/save_components/save_form.dart';

class SaveCategorieView extends StatelessWidget {
  SaveController get _upsaveController => SaveController.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.save), onPressed: () {
          _upsaveController.saveCategorie(Categoria(
                              nome: _upsaveController.nome.text,
                              desc: _upsaveController.nome.text,
                              url: _upsaveController.url.text,
                              selected: false,
                              id: Random().nextInt(1 << 32)));
        })],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.white])),
          child: FormSave()),
      bottomNavigationBar: bottomAppBar()
    );
  }
}
