import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_views/_entidade/pagamento/pagamento_cliente_controller.dart';

class PagamentoClienteView extends StatelessWidget {
  PagamentoClienteController get _controller =>
      PagamentoClienteController.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pagamentos do Clientes"),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<ParseObject>>(
                  future: _controller.listaPagamento(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Text(
                                      "Cliente: ${snapshot.data![index]["cliente"]["nome"]}"),
                                  subtitle: Text(
                                      "Valor Pago: ${snapshot.data![index]["valor"]}"),
                                  onTap: () {
                                    /*  
                                  Get.to(,///
                                      arguments: snapshot.data![index]);  */
                                  },
                                ),
                                Text(
                                    "Descrição do Leilão: ${snapshot.data![index]["leilao"]["descricao"]}"),
                                SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Image.network(snapshot.data![index]
                                            ["comprovativo"]["url"]
                                        .toString())),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: snapshot.data![index]["isDone"]
                                        ? Chip(
                                            label: Text("Aceite"),
                                            backgroundColor: Colors.green[500],
                                            avatar: Icon(Icons.check),
                                            elevation: 4,
                                          )
                                        : ElevatedButton(
                                            onPressed: () {
                                              _controller.aceitarComprovativo(
                                                  context,
                                                  snapshot.data![index]
                                                      ["objectId"]);
                                            },
                                            child: Text("Confirmar"),
                                          ),
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
                ),
              )
            ],
          ),
        ));
  }
}
