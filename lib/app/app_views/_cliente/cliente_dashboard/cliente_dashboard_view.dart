import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_dashboard/cliente_dashboard_controller.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_dashboard/cliente_pedido_aceitado.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_dashboard/cliente_pedido_enviado.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_dashboard/cliente_pedido_recibo.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

class ClienteDashBoardView extends StatelessWidget {
  final _controller = ClienteDashBoardController.controller;

  @override
  Widget build(BuildContext context) {
    print("Obras Registadas ${_controller.obraLista.length}");

    //Função que actualiza os dados do DashBoard
    _controller.dashBoardFresh();

    return _controller.obraLista.length > 0
        ? SafeArea(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Scaffold(
                  appBar: AppBar(
                    title: Row(
                      children: [
                        Text("Usuário: "),
                        Text(_controller.cliente[0].nome, style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return Center(
                                child: Container(
                                  width: larguraPor(90, context),
                                  height: alturaPor(30, context),
                                  color: Colors.blue[100],
                                ),
                              );
                            });
                          },
                          child: CircleAvatar()),
                      )
                    ],
                    bottom: TabBar(
                      tabs: [
                        Text(
                          "Pedidos Enviados",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Pedidos Aceitados",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Pedidos Recibo",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      ClientePedidoEnviado(),
                      ClientePedidoAceitado(),
                      ClientePedidoRecibo(),
                    ],
                  )),
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
