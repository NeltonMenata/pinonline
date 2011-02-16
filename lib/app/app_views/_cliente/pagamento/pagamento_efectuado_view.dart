import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'pagamento_controller.dart';

class PagamentoEfectuado extends StatelessWidget {
  PagamentoController get _controller => PagamentoController.controller;

  @override
  Widget build(BuildContext context) {
    var objectIdLeilao = Get.arguments.toString();
    return Scaffold(
        appBar: AppBar(
          title: Text("Pagamentos Feitos"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              FutureBuilder<List<ParseObject>>(
                future: _controller.listaPagamento(objectIdLeilao),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                    "Descrição do Leilão: ${snapshot.data![index]["leilao"]["descricao"]}"),
                                subtitle: Text(
                                    "Valor do Leilão: ${snapshot.data![index]["leilao"]["valorMax"]}"),
                                onTap: () {
                                  Get.to(PagamentoEfectuado(),
                                      arguments: snapshot.data![index]
                                              ["objectId"]
                                          .toString());
                                },
                              ),
                              Center(
                                child: Container(
                                  width: 155,
                                  height: 155,
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Image.network(snapshot.data![index]
                                      ["comprovativo"]["url"]),
                                ),
                              )
                            ],
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
              )
            ],
          ),
        ));
  }
}
