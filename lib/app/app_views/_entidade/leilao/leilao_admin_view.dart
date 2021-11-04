import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'leilao_admin_controller.dart';
import 'leilao_admin_select_view.dart';

class LeilaoAdminView extends StatelessWidget {
  const LeilaoAdminView({Key? key}) : super(key: key);
  LeilaoAdminController get controller => LeilaoAdminController.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(actions: [], title: Text("Leilões Solictados por Cliente")),
      body: Center(
          child: FutureBuilder<List<ParseObject>>(
        future: controller.listaLeilao(),
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
                              Get.to(LeilaoAdminSelectView(),
                                  arguments: snapshot.data![index]);
                            },
                            icon: Icon(Icons.send_rounded),
                            label: Text("Ver mais:")),
                        onTap: () async {
                          
                        },
                      ),
                      Text(
                          "Localização da Obra: ${snapshot.data![index]["localizacao"]}"),
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
