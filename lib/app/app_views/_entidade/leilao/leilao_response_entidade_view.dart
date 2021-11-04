import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_controller/_entidade/entidade_login_controller.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'leilao_admin_controller.dart';

class LeilaoResponseEntidadeView extends StatelessWidget {
  LeilaoAdminController get _controller => LeilaoAdminController.controller;
  EntidadeModel get entidade => EntidadeLoginController.controller.entidade[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text("Respostas dos Profissionais"),
      ),
      body: Column(
        children: [
          Container(),
          Expanded(
            child: FutureBuilder<List<ParseObject>>(
              future: _controller.adminLeilaoResponseEntidade(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Profissional: ${snapshot.data![index]["entidade"]["nome"].toString()}"),
                                    ]),
                                subtitle: Text(
                                    "Valor Proposta: ${snapshot.data![index]["valorProposta"].toString()}"),
                                onTap: () {},
                                trailing: snapshot.data![index]["propostaAceite"]?
                                Chip(
                                  label: Text("Proposta Atribuida"),
                                  avatar: Icon(Icons.check),
                                  elevation: 4,
                                  backgroundColor: Colors.green[500],
                                )
                                :TextButton(
                                    onPressed: () {
                                      _controller.aceitaPropostaLeilao(snapshot.data![index]["objectId"], snapshot.data![index]["leilao"]["objectId"]);
                                    }, child: Text("Aceitar Proposta")),
                              ),
                              ListTile(
                                title: Text(
                                    "Cliente: ${snapshot.data![index]["leilao"]["cliente"]["nome"].toString()}"),
                                subtitle: Text(
                                    "Valor posto em Leilão: ${snapshot.data![index]["leilao"]["valorMax"].toString()}"),
                              ),
                              ListTile(
                                title: Text("Descrição: "),
                                subtitle: Text(
                                    "Valor posto em Leilão: ${snapshot.data![index]["leilao"]["descricao"]}"),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: snapshot.data!.length);
                } else if (snapshot.hasError) {
                  return Text("Erro: " + snapshot.error.toString());
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
