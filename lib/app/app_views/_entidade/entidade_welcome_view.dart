import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_login_view.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

class EntidadeWelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                color: Colors.green[500],
                width: double.infinity,
                height: alturaPor(10, context),
                child: Column(children: [Text("DashBoard Profissional")]),
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
                                onPressed: () {},
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
                                child: Text("Obras em Curso",textAlign: TextAlign.center)),
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
                                child: Text("Financeiro",textAlign: TextAlign.center)),
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
                                child: Text("Logisticas e Materias",textAlign: TextAlign.center)),
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
                                child: Text("Recursos Humanos",textAlign: TextAlign.center)),
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
                                child: Text("Promova a sua Empresa", textAlign: TextAlign.center)),
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
