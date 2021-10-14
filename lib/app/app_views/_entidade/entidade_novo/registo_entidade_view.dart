import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_entidade/entidade_novo/create_entidade_controller.dart';

import 'registo_entidade_view2.dart';

// ignore: must_be_immutable
class RegistoEntidadeView extends StatelessWidget {
  CreateEntidadeController get _controller =>
      CreateEntidadeController.controller;
  Widget build(BuildContext context) {
    //final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: ListTile(
            title: Text("Dados da Empresa"),
            subtitle: Text("Insira os Dados de sua entidade")),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              Container(
                color: Colors.transparent,
                height: (alturaTotal * 0.85),
                child: Form(
                  key: _controller.formRegisto,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Telefone",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _controller.telefone,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: 'Telefone',
                                  border: OutlineInputBorder()),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Morada",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _controller.morada,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: 'Morada',
                                  border: OutlineInputBorder()),
                            ),
                          ],
                        ),
                      ),
                 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cidade",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _controller.cidade,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: 'Cidade',
                                  border: OutlineInputBorder()),
                            ),
                          ],
                        ),
                      ),
                    
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Descrição",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _controller.desc,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: 'Descrição',
                                  border: OutlineInputBorder()),
                            ),
                          ],
                        ),
                      ),
                      
                      Spacer(),
                      Obx(() {
                        return Visibility(
                          visible: _controller.isSave.value,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }),
                      Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () => Get.to(RegistoEntidadeView2()),
                          child: Text("Continuar")),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Ignorar"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
