import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_dashboard_controller.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

class ClienteDashBoardView extends StatelessWidget {
  final _controller = ClienteDashBoardController.controller;

  @override
  Widget build(BuildContext context) {
    return _controller.obraLista.length > 0
        ? SafeArea(
            child: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: larguraPor(100, context),
                            height: alturaPor(30, context),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20)),
                            ),
                            child: ListView(children: [
                              ListTile(
                                title: Text("Cliente:"),
                                subtitle: Text(_controller
                                    .obraLista[0].orcamento.cliente.nome),
                              ),
                              ListTile(
                                title: Text("Email:"),
                                subtitle: Text(_controller
                                    .obraLista[0].orcamento.cliente.email),
                              ),
                              ListTile(
                                title: Text("Contacto:"),
                                subtitle: Text(_controller
                                    .obraLista[0].orcamento.cliente.contacto),
                              ),
                              ListTile(
                                title: Text("Morada:"),
                                subtitle: Text(_controller
                                    .obraLista[0].orcamento.cliente.morada),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: larguraPor(100, context),
                              height: alturaPor(30, context),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20)),
                              ),
                              child: ListView(children: [
                                ListTile(
                                  title:
                                      Text("Entidade Prestadora de Serviço:"),
                                  subtitle: Text(
                                      _controller.obraLista[0].entidade.nome),
                                ),
                                ListTile(
                                  title: Text("Email:"),
                                  subtitle: Text(
                                      _controller.obraLista[0].entidade.email),
                                ),
                                ListTile(
                                  title: Text("Contacto:"),
                                  subtitle: Text(_controller
                                      .obraLista[0].entidade.contacto),
                                ),
                                ListTile(
                                  title: Text("Morada:"),
                                  subtitle: Text(
                                      _controller.obraLista[0].entidade.morada),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Pedidos Pendentes"),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Pedidos Aceites"),
                            ),
                          ],
                        ),
                        Spacer()
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              body: ListTile(
                title: Text(
                  "O DashBoard encontra-se vazio",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: Text(
                  "Grave um pedido de Obra/Orçamento para Veres no DashBoard!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
  }
}
