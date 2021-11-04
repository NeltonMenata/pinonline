import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_views/_cliente/pagamento/efectua_pagamento_view.dart';

import 'pagamento_controller.dart';

class ListaEfectuaPagamento extends StatelessWidget {
  PagamentoController get _controller => PagamentoController.controller;
  ClienteModel get _cliente => ClienteLoginController.controller.cliente[0];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pagamento"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(
              child: FutureBuilder<List<ParseObject>>(
                future: _controller.listaLeilao(_cliente.objectId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                "Descrição do Leilão: ${snapshot.data![index]["descricao"]}"),
                            subtitle: Text(
                                "Valor do Leilão: ${snapshot.data![index]["valorMax"]}"),
                            onTap: () {
                              Get.to(EfectuaPagamento(),
                                  arguments: snapshot.data![index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: snapshot.data!.length);
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Erro: ${snapshot.error}"),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
