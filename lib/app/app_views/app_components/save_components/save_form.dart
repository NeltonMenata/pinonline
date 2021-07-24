import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller.dart/save_controller.dart';
import 'package:pinonline/app/app_models/categorias_model.dart';

// ignore: must_be_immutable
class FormSave extends StatelessWidget {
  SaveController get _saveController => SaveController.controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0, top: 30),
              child: Text(
                "Cadastrar Profissão",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              child: GetBuilder<SaveController>(
                init: SaveController(),
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _saveController.nome,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Nome da Categoria',
                          icon: Icon(Icons.account_circle),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _saveController.desc,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Descrição',
                          icon: Icon(Icons.description),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _saveController.url,
                      decoration: InputDecoration(
                          labelText: 'url da imagem',
                          icon: Icon(Icons.image_rounded),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _saveController.saveCategorie(Categoria(
                              nome: _saveController.nome.text,
                              desc: _saveController.nome.text,
                              url: _saveController.url.text,
                              selected: false,
                              id: Random().nextInt(1 << 32)));
                        },
                        child: Text("Salvar Cadastro"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
