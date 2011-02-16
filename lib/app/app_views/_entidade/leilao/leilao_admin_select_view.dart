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
    var cliente = Get.arguments as ParseObject;
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
                onPressed: () async {
                  controller.isSend.value = true;
                  //await controller.enviaPropostaLeilao(_objectId);
                  controller.isSend.value = false;
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
                                cliente.get("cliente").get("nome"),
                              ),
                            ),
                            ListTile(
                              title: Text("Email:"),
                              subtitle: Text(
                                cliente["cliente"]["email"].toString(),
                              ),
                            ),
                            ListTile(
                              title: Text("Telefone:"),
                              subtitle: Text(
                                cliente["cliente"]["telefone"].toString(),
                              ),
                            ),
                            ListTile(
                              title: Text("Morada:"),
                              subtitle: Text(
                                cliente.get("cliente").get("morada").toString(),
                              ),
                            ),
                            ListTile(
                              title: Text("Cidade:"),
                              subtitle: Text(
                                cliente.get("cliente").get("cidade").toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: alturaPor(40, context),
                        child: FutureBuilder(
                            future:
                                controller.loadPdf(cliente["documento"]["url"]),
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
            Obx(
              () => Container(
                height: 50,
                child: Center(
                    child: controller.isSend.value
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
