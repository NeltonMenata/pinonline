import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_views/_entidade/leilao/leilao_admin_view.dart';

// ignore: must_be_immutable
class LeilaoAdminSelectView extends StatelessWidget {
  LeilaoAdminController get controller => LeilaoAdminController.controller;

  @override
  Widget build(BuildContext context) {
    String _objectId = Get.arguments.toString();
    return WillPopScope(
      onWillPop: () async {
        controller.entidade!.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton.icon(
                onPressed: () {},
                icon: GetBuilder<LeilaoAdminController>(
                    init: LeilaoAdminController(),
                    builder: (_) => Checkbox(
                        value: controller.isSelected,
                        onChanged: (v) {
                          controller.toggleSelectionAll();
                          print(controller.isSelected);
                        })),
                label: Text("Select All")),
            IconButton(
                onPressed: () async {
                  controller.isSend.value = true;
                  await controller.enviaPropostaLeilao(_objectId);
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
                builder: (_) => FutureBuilder<List<ParseObject>>(
                  future: controller.entidadeLeilao(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      snapshot.data!.forEach((element) {
                        controller.entidade!.add(EntidadeModel(
                            objectId: element.objectId!,
                            senha: element.get("senha"),
                            nome: element.get("nome"),
                            desc: element.get("descricao"),
                            img: element.get("img")["url"],
                            contacto: element.get("contacto"),
                            admin: element.get("admin"),
                            categoria: element.get("categoria").toString(),
                            email: element.get("email"),
                            morada: element.get("morada")));
                      });
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(
                                controller.entidade![index].nome,
                              ),
                              subtitle: Text(
                                controller.entidade![index].email.toString(),
                              ),
                              onTap: () {},
                              trailing: Text(_objectId),
                              leading: GetBuilder<LeilaoAdminController>(
                                builder: (_) {
                                  return Checkbox(
                                      value: controller
                                          .entidade![index].isSelected,
                                      onChanged: (v) {
                                        controller.toggleSelectEntidade(
                                            v!, index);
                                        print(controller
                                            .entidade![index].isSelected);
                                      });
                                },
                              ));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
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
