import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_dashboard/cliente_dashboard_controller.dart';

class ClientePedidoAceitado extends StatelessWidget {

  final _controller = ClienteDashBoardController.controller;
  

  @override
  Widget build(BuildContext context) {
    _controller.dashBoardFresh();
    
    return Column(
      children:[
       
      ]
    );
  }
}