import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_obra/obra_save_controller.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

// ignore: must_be_immutable
class ObraSaveView extends StatelessWidget {
  var _controller = ObraSaveController.controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            height: alturaPor(25, context),
            color: Colors.blue,
            child: Column(
              children: [
                CircleAvatar(
                  radius: larguraPor(15, context),
                ),
                ListTile(
                  title: Text(
                      "Verifique os Dados da Entidade que fornecerá o Serviço e clique em Guardar"),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Text("Dados do Prestador de Serviço"),
                Container(
                  color: Colors.amber[100],
                  height: 50,
                  width: larguraPor(100, context),
                  child: ListTile(
                    title: Text(
                        "Nome: " + ObraSaveController.obra[0].entidade.nome),
                  ),
                ),
                Container(
                  color: Colors.amber[100],
                  height: 50,
                  width: larguraPor(100, context),
                  child: ListTile(
                    title: Text(
                        "Email: " + ObraSaveController.obra[0].entidade.email),
                  ),
                ),
                Container(
                  color: Colors.amber[100],
                  height: 50,
                  width: larguraPor(100, context),
                  child: ListTile(
                    title: Text("Contacto: " +
                        ObraSaveController.obra[0].entidade.contacto),
                  ),
                )
              ]),
            ),
          ),
          Container(
            child: ElevatedButton.icon(
              onPressed: () {
                _controller.saveDialog(context);
                // ignore: unnecessary_statements 
              },
              icon: Icon(Icons.add),
              label: Text("Guardar"),
            ),
          ),
        ],
      )),
    ));
  }
}

