import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_views/_entidade/leilao/leilao_response_entidade_view.dart';

import 'leilao_admin_controller.dart';

class LeilaoAdminResponseView extends StatelessWidget {
 LeilaoAdminController get _controller => LeilaoAdminController.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(actions: [], title: Text("Leilões Solicitados por Cliente")),
      body: Center(
          child: FutureBuilder<List<ParseObject>>(
        future: _controller.listaLeilao(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Cliente: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data![index]["cliente"]["nome"].toString(),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      ListTile(
                        title: Text(
                          "Descrição: " +
                              snapshot.data![index].get("descricao"),
                        ),
                        subtitle: Text(
                          "Valor de Leilão: " +
                              snapshot.data![index].get("valorMax").toString(),
                        ),
                        trailing: TextButton.icon(
                            onPressed: () {
                              Get.to(LeilaoResponseEntidadeView(),
                                  arguments: snapshot.data![index]["objectId"]
                                      .toString());
                            },
                            icon: Icon(Icons.send_rounded),
                            label: Text("Ver respostas")),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}