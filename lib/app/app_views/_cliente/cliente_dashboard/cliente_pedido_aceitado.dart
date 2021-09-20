import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_dashboard/cliente_dashboard_controller.dart';

import 'components/obra_component_view.dart';

class ClientePedidoAceitado extends StatelessWidget {
  final _controller = ClienteDashBoardController.controller;

  @override
  Widget build(BuildContext context) {
    _controller.dashBoardFresh();

    return Center(
      child: Container(
        color: Colors.blue,
        child: ListView.builder(
            itemCount: _controller.clientePedidoEnviado.length,
            itemBuilder: (context, index) {
              return obraComponentAceitado(
                entNome: _controller.clientePedidoEnviado[index].entidade.nome,
                entEmail:
                    _controller.clientePedidoEnviado[index].entidade.email,
                entCategoria:
                    _controller.clientePedidoEnviado[index].entidade.categoria,
                entContacto:
                    _controller.clientePedidoEnviado[index].entidade.contacto,
                entMorada:
                    _controller.clientePedidoEnviado[index].entidade.morada,
                cliDesc: _controller.clientePedidoEnviado[index].orcamento.desc,
                entImg: _controller.clientePedidoEnviado[index].entidade.img,
                context: context,
                entDesc: _controller.clientePedidoEnviado[index].entidade.desc,
                confirmar: () => _confirmar(context),
              );
            }),
      ),
    );
  }

  _confirmar(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("JustBuild"),
            content: Text("Tens certeza que aceitas a contra-proposta?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "JustBuild",
                            style: TextStyle(color: Colors.green),
                          ),
                          content: Text(
                              "Vosso contracto foi confirmado com sucesso para ambas as partes!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"))
                          ],
                        );
                      });
                },
                child: Text("Sim"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Não"),
              ),
            ],
          );
        });
  }
}
