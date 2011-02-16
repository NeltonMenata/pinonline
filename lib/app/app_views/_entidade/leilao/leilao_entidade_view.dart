import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_controller/_entidade/entidade_login_controller.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'leilao_admin_controller.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

import 'leilao_entidade_select_view.dart';

class LeilaoEntidadeView extends StatelessWidget {
  EntidadeModel get entidade => EntidadeLoginController.controller.entidade[0];
  LeilaoAdminController get controller => LeilaoAdminController.controller;
  @override
  Widget build(BuildContext context) {
    String _objectIdEntidade = entidade.objectId;
    return Scaffold(
      appBar: AppBar(title: Text("Leilões Disponíveis")),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: alturaPor(90, context),
              child: FutureBuilder<List<ParseObject>>(
                future:
                    controller.entidadeListaPropostaLeilao(_objectIdEntidade),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    
                    return ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          
                          return ListTile(
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Cliente: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data![index]["leilao"]
                                            ["cliente"]["nome"]
                                        .toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Descrição da Obra: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data![index]["leilao"]
                                            ["descricao"]
                                        .toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Valor de Leilão: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data![index]["leilao"]
                                            ["valorMax"]
                                        .toString()),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton.icon(
                                  icon: Icon(Icons.send_rounded),
                                  onPressed: () {
                                    Get.to(LeilaoEntidadeSelect(), arguments: snapshot.data![index]);
                                  },
                                  label: Text("Ver mais!"),
                                ),
                              ],
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    Get.snackbar("Erro", "Mensagem do erro: ${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
