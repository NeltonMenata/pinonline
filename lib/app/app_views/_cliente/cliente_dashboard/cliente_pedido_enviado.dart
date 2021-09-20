import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_dashboard/cliente_dashboard_controller.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_dashboard/components/obra_component_view.dart';

class ClientePedidoEnviado extends StatelessWidget {
  final _controller = ClienteDashBoardController.controller;

  @override
  Widget build(BuildContext context) {
    _controller.dashBoardFresh();
    print("Obras registradas: ${_controller.clientePedidoEnviado.length}");
    print(
        " Cliente Done: ${_controller.clientePedidoEnviado[0].clienteDone} \nEntidade Done: ${_controller.clientePedidoEnviado[0].entidadeDone}");
    return Center(
      child: Container(
        color: Colors.orange,
        child: ListView.builder(
            itemCount: _controller.clientePedidoEnviado.length,
            itemBuilder: (context, index) {
              return obraComponent(
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
                deletar: () => _delete(context),
              );
            }),
      ),
    );
  }

void _delete(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("JustBuild"),
          content: Text("Eliminiar está obra?"),
          actions: [
            TextButton(
              child: Text("Sim"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Não"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}


}

