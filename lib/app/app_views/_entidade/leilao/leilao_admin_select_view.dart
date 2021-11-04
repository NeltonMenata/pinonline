import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'leilao_admin_controller.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

// ignore: must_be_immutable
class LeilaoAdminSelectView extends StatelessWidget {
  LeilaoAdminController get controller => LeilaoAdminController.controller;

  @override
  Widget build(BuildContext context) {
    var leilao = Get.arguments as ParseObject;
    return WillPopScope(
      onWillPop: () async {
        controller.entidade!.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dados do Cliente"),
          actions: [
            IconButton(
                onPressed: (){
                  controller.sendProgressIndicator(true);
                  controller.enviaPropostaLeilao(leilao.objectId!);
                  controller.sendProgressIndicator(false);
                },
                icon: Icon(Icons.send_outlined))
          ],
        ),
        body: Center(
            child: Column(
          children: [
            Expanded(
              child: GetBuilder<LeilaoAdminController>(
                init: LeilaoAdminController(),
                builder: (_) => Container(
                  child: Column(
                    children: [
                      Container(
                        height: alturaPor(40, context),
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text("Nome:"),
                              subtitle: Text(
                                leilao.get("cliente").get("nome"),
                              ),
                            ),
                            ListTile(
                              title: Text("Email:"),
                              subtitle: Text(
                                leilao["cliente"]["email"].toString(),
                              ),
                            ),
                            ListTile(
                              title: Text("Telefone:"),
                              subtitle: Text(
                                leilao["cliente"]["telefone"].toString(),
                              ),
                            ),
                            ListTile(
                              title: Text("Descrição do Leilão:"),
                              subtitle: Text(
                                leilao.get("descricao").toString(),
                              ),
                            ),
                            ListTile(
                              title: Text("Valor do Leilão:"),
                              subtitle: Text(
                                leilao.get("valorMax").toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: alturaPor(40, context),
                        child: FutureBuilder(
                            future:
                                controller.loadPdf(leilao["documento"]["url"]),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return PDFView(
                                  filePath: snapshot.data as String,
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                      "Erro ao carregar: ${snapshot.error}"),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<LeilaoAdminController>(
              init: LeilaoAdminController(),
              builder:(_) => Container(
                height: 50,
                child: Center(
                    child: controller.isSend
                        ? CircularProgressIndicator()
                        : Container()),
              ),
            )
          ],
        )),
      ),
    );
  }
}
