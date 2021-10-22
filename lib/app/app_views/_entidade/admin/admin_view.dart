import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/_entidade/leilao/leilao_admin_view.dart';
import 'package:pinonline/app/app_views/_entidade/leilao/leilao_response_entidade_view.dart';

class AdminVew extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profissional Admin"),
        ),
        body: Center(
          child: Column(
            children: [
              ListTile(
                leading:
                    CircleAvatar(child: Icon(Icons.question_answer_rounded)),
                title: Text("Listar pedidos de leilões de Clientes"),
                onTap: () {
                  Get.to(LeilaoAdminView());
                },
              ),
              ListTile(
                leading: CircleAvatar(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/img/logo_profissional.png"),
                )),
                title: Text("Listar respostas de Leilões de Profissionais"),
                onTap: () {
                  Get.to(LeilaoResponseEntidadeView());
                },
              )
            ],
          ),
        ));
  }
}
