import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_obra_nova_controller.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';

// ignore: must_be_immutable
class ClienteObraNovaView extends StatelessWidget {
  final _controller = ClienteObraNovaController.controller;
  final _controllerLogin = ClienteLoginController.controller;
  @override
  Widget build(BuildContext context) {
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
                      backgroundColor: Colors.green,
                        radius: larguraPor(15, context),
                        child: Image.network(
                          _controllerLogin.cliente[0].img,
                          width: double.infinity,
                          height: double.infinity,
                        )),
                    ListTile(
                      title: Text("Nome do Cliente"),
                      subtitle: Text(_controllerLogin.cliente[0].nome),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text("Email"),
                      subtitle: Text(_controllerLogin.cliente[0].email),
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
                              controller: _controller.descOrcamento,
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
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Voltar")),
                    ElevatedButton(
                        onPressed: _controller.continuar,
                        child: Text("Continuar")),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomAppBar(),
      ),
    );
  }
}
