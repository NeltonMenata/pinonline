import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_dashboard/cliente_dashboard_view.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_login_view.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';

import 'cliente_obra_nova_view.dart';

class ClienteWelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cliente = ClienteLoginController.controller.cliente[0];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                color: Colors.blue[100],
                width: double.infinity,
                height: alturaPor(30, context),
                child: Column(children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    radius:
                        larguraPor(15, context), //_alturaTotal < 600 ? 50 : 65,
                    child: Image.asset(
                      "assets/img/logo.png",
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(height: alturaPor(100, context) < 600 ? 15 : 20),
                  Text(
                    cliente.nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: alturaPor(100, context) < 600 ? 20 : 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Escolhe uma das opções para o seu devido tratamento!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: alturaPor(100, context) < 600 ? 12 : 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: alturaPor(10, context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: larguraPor(30, context),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(15))),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 35,
                                    child: Image.asset("assets/img/logo.png"))),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "DashBoard e Status Cliente/Obra",
                                  style: TextStyle(
                                      //fontSize: _alturaTotal < 600 ? 14 : 17,
                                      ),
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  "Veja como está sendo geridas as suas atividades!",
                                  style: TextStyle(
                                      //fontSize: _alturaTotal < 600 ? 12 : 14,
                                      ),
                                  maxLines: 2,
                                ),
                                onTap: () {
                                  Get.to(ClienteDashBoardView());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: alturaPor(10, context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: larguraPor(30, context),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(15))),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 35,
                                    child: Image.asset("assets/img/logo.png"))),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Quer iniciar uma Obra nova",
                                  style: TextStyle(
                                      //fontSize: _alturaTotal < 600 ? 14 : 17,
                                      ),
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  "Inicia a sua Obra nova com a JustBuild a escolha número 1!",
                                  style: TextStyle(
                                      //fontSize: _alturaTotal < 600 ? 12 : 14,
                                      ),
                                  maxLines: 2,
                                ),
                                onTap: () {
                                  Get.to(ClienteObraNovaView());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: alturaPor(10, context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: larguraPor(30, context),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(15))),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 35,
                                    child: Image.asset("assets/img/logo.png"))),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Quer passar a Gestão da sua Obra para nós",
                                  style: TextStyle(
                                      //fontSize: _alturaTotal < 600 ? 14 : 17,
                                      ),
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  "Com a JustBuild tens a tua Obra executada com prazo acordado!",
                                  style: TextStyle(
                                      //fontSize: _alturaTotal < 600 ? 12 : 14,
                                      ),
                                  maxLines: 2,
                                ),
                                onTap: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: alturaPor(10, context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: larguraPor(30, context),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(15))),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 35,
                                    child: Image.asset("assets/img/logo.png"))),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Quer ver os Profissionais perto de você",
                                  style: TextStyle(
                                      //fontSize: _alturaTotal < 600 ? 14 : 17,
                                      ),
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  "Encontre Profissionais de qualidade para sua obra!",
                                  style: TextStyle(
                                      //fontSize: _alturaTotal < 600 ? 12 : 14,
                                      ),
                                  maxLines: 2,
                                ),
                                onTap: () {
                                  Get.toNamed(Routes.HOME);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {

                  Get.offAll(ClienteLoginView());
                },
                child: Text("Terminar Sessão"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*

Container(
                height: alturaPor(10, context),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                        width: larguraPor(30, context),
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15))),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: Image.asset("assets/img/logo.png"))),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Quer iniciar uma Obra nova",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 14 : 17,
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Inicia a sua Obra nova com a JustBuild a escolha número 1!",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 12 : 14,
                          ),
                          maxLines: 2,
                        ),
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: alturaPor(10, context),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                        width: larguraPor(30, context),
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15))),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: Image.asset("assets/img/logo.png"))),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Quer passar a Gestão da sua Obra para nós",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 14 : 17,
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Com a JustBuild tens a tua Obra executada com prazo acordado!",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 12 : 14,
                          ),
                          
                          maxLines: 2,
                        ),
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: alturaPor(10, context),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                        width: larguraPor(30, context),
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15))),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: Image.asset("assets/img/logo.png"))),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Quer ver os Profissionais perto de você",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 14 : 17,
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Encontre Profissionais de qualidade para sua obra!",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 12 : 14,
                          ),
                          maxLines: 2,
                        ),
                        onTap: () {
                          Get.toNamed(Routes.HOME);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              

 */



