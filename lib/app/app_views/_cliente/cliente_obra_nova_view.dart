import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_models/orcamento_model.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:pinonline/app/app_views/_orcamento/orcamento_view.dart';

// ignore: must_be_immutable
class ClienteObraNovaView extends StatelessWidget {
  var _descOrcamento = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _controller = ClienteLoginController.controller;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                height: alturaPor(40, context),
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: larguraPor(15, context),
                    ),
                    ListTile(
                      title: Text("Nome do Cliente"),
                      subtitle: Text(_controller.cliente[0].nome),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text("Email"),
                      subtitle: Text(_controller.cliente[0].email),
                      leading: Icon(Icons.email),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        height: alturaPor(30, context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Registrar uma Obra nova!"),
                              subtitle: Text("Descreva a sua obra"),
                            ),
                            TextFormField(
                              controller: _descOrcamento,
                              maxLines: 4,
                              decoration: InputDecoration(
                                hintText: "Descreva a sua obra aqui",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Cancelar")),
                  ElevatedButton(
                      onPressed: () async {
                        await Get.to(OrcamentoView(),
                            arguments: OrcamentoModel(
                                cliente: _controller.cliente[0],
                                done: false,
                                desc: _descOrcamento.text,
                                objectId: "objectId"));
                      },
                      child: Text("Continuar")),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
