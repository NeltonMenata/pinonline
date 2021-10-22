import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_entidade/entidade_login_controller.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_login_view.dart';
import 'package:pinonline/app/app_views/_entidade/leilao/leilao_entidade_view.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

import 'admin/admin_view.dart';

class EntidadeWelcomeView extends StatelessWidget {
  EntidadeLoginController get controller => EntidadeLoginController.controller;
  EntidadeModel get entidade => EntidadeLoginController.controller.entidade[0];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  color: Colors.green[500],
                  width: double.infinity,
                  height: alturaPor(10, context),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Visibility(
                          visible: entidade.admin!,
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.to(AdminVew());
                                  },
                                  icon: Icon(Icons.admin_panel_settings_outlined)),
                              Text("Admin")
                            ],
                          ),
                        ),
                        Text("DashBoard Profissional: ${entidade.nome}")
                      ])
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: larguraPor(35, context),
                              height: larguraPor(35, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black87)),
                                  onPressed: () {},
                                  child: Text("Gerir Pedidos")),
                            ),
                            Container(
                              width: larguraPor(35, context),
                              height: larguraPor(35, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black87)),
                                  onPressed: () {
                                    Get.to(LeilaoEntidadeView(),
                                        arguments: entidade.objectId);
                                  },
                                  child: Text("Leilões")),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: larguraPor(35, context),
                              height: larguraPor(35, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black87)),
                                  onPressed: () {},
                                  child: Text("Obras em Curso",
                                      textAlign: TextAlign.center)),
                            ),
                            Container(
                              width: larguraPor(35, context),
                              height: larguraPor(35, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black87)),
                                  onPressed: () {},
                                  child: Text("Financeiro",
                                      textAlign: TextAlign.center)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: larguraPor(35, context),
                              height: larguraPor(35, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black87)),
                                  onPressed: () {},
                                  child: Text("Logisticas e Materias",
                                      textAlign: TextAlign.center)),
                            ),
                            Container(
                              width: larguraPor(35, context),
                              height: larguraPor(35, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black87)),
                                  onPressed: () {},
                                  child: Text("Recursos Humanos",
                                      textAlign: TextAlign.center)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: larguraPor(35, context),
                              height: larguraPor(35, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black87)),
                                  onPressed: () {},
                                  child: Text("Promova a sua Empresa",
                                      textAlign: TextAlign.center)),
                            ),
                            Container(
                              width: larguraPor(35, context),
                              height: larguraPor(35, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black87)),
                                  onPressed: () {},
                                  child: Text("Fale Connosco")),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.clearLogin();
                    Get.offAll(EntidadeLoginView());
                  },
                  child: Text("Terminar Sessão"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
