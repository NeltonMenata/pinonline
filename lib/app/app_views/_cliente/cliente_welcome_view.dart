import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_dashboard/cliente_dashboard_view.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_financeiro_view.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_login_view.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';
import 'cliente_obra_nova_view.dart';
import 'leilao/teste/leilao_cliente_view.dart';
import 'leilao/teste/leilao_response_cliente_view.dart';
import 'pagamento/pagamento_view.dart';

class ClienteWelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = ClienteLoginController.controller;
    var cliente = ClienteLoginController.controller.cliente[0];
    return WillPopScope(
      onWillPop: () async => false,
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
                  child: Center(
                    child: Text(
                      "Nome do Usuário: ${cliente.nome}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black87)),
                                  onPressed: () {
                                    Get.to(ClienteDashBoardView());
                                  },
                                  child: Text("Pedidos")),
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
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black87)),
                                  onPressed: () {
                                    Get.to(ClienteObraNovaView());
                                  },
                                  child: Text("Obras")),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
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
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black87)),
                                  onPressed: () {
                                    Get.to(ClienteFinanceiroView());
                                  },
                                  child: Text("Financeiros")),
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
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black87)),
                                  onPressed: () {
                                    
                                  },
                                  child: Text("Materiais")),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
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
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black87)),
                                  onPressed: () {
                                    Get.to(PagamentoView());
                                  },
                                  child: Text("Pagamento")),
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
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black87)),
                                  onPressed: () {
                                    Get.to(ClienteDashBoardView());
                                  },
                                  child: Text("Avaliações")),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
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
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black87)),
                                  onPressed: () {
                                    Get.to(LeilaoResponseClienteView());
                                  },
                                  child: Text("Leilões Respondidos")),
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
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black87)),
                                  onPressed: () {
                                    Get.to(LeilaoClienteView());
                                  },
                                  child: Text("Leilão")),
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
                    Get.offAll(ClienteLoginView());
                  },
                  child: Text("Terminar Sessão"),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomAppBar(),
      ),
    );
  }
}

/*
LeilaoClienteView()
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



