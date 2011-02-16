import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'lista_efectua_pagamento_view.dart';
import 'lista_pagamento_efectuado_view.dart';

class PagamentoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento de Serviços"),
      ),
      body: Container(
        width: double.infinity,
        height: alturaPor(70, context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Pagamentos Efectuados",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.money),
                onTap: (){
                  Get.to(ListaPagamentoEfectuado());
                },
              ),
              ListTile(
                title: Text(
                  "Efectuar Pagamentos",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.money),
                onTap: (){
                  Get.to(ListaEfectuaPagamento());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
