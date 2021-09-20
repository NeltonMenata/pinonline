import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_dashboard/cliente_dashboard_controller.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_dashboard/components/obra_component_view.dart';

class ClientePedidoRecibo extends StatelessWidget {

final _controller = ClienteDashBoardController.controller;
  
  @override
  Widget build(BuildContext context) {
    _controller.dashBoardFresh();
    return Center(
      child: Container(
        color: Colors.green[300],
        child: ListView.builder(
            itemCount: _controller.clientePedidoEnviado.length,
            itemBuilder: (context, index) {
              return obraComponentRecibo(
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
                
              );
            }),
      ),
    );
  }
}