import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';

import 'leilao_cliente_view.dart';

class LeilaoResponseClienteView extends StatelessWidget {
  ClienteModel get cliente => ClienteLoginController.controller.cliente[0];
  ControllerLeilao get _controller => ControllerLeilao.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Leilões Pedidos",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            Expanded(
                child: FutureBuilder<List<ParseObject>>(
                    future: _controller.clienteLeilaoResponse(cliente.objectId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    "Profissional: " + snapshot.data![index]["cliente"]["nome"].toString()),
                                subtitle: Text("Valor"),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: snapshot.data!.length);
                      } else if (snapshot.hasError) {
                        return Text("Erro: ${snapshot.error}");
                      }
                      return Center(child: CircularProgressIndicator());
                    }))
          ],
        ),
      ),
    );
  }
}
