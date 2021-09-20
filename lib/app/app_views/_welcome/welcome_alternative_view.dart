import 'package:flutter/material.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_login_view.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_login_view.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/create_session.dart';

class WelcomeAlternativeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var _larguraTotal = MediaQuery.of(context).size.width;
    //var _containerMain = _larguraTotal * 0.92;
    var _alturaTotal = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                color: Colors.white70,
                width: double.infinity,
                height: alturaPor(30, context),
                child: Column(children: [
                  Container(
                      height: alturaPor(20, context),
                      child: Image.asset("assets/img/logo1.png")),
                  Spacer(),
                  Text(
                    "Seja bem-vindo a sua plataforma",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _alturaTotal < 600 ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                        fontFamily: "Times New Roman"),
                  ),
                ]),
              ),
              Expanded(
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(ClienteLoginView());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: larguraPor(40, context),
                                height: larguraPor(40, context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black87,
                                        width: 2.0,
                                        style: BorderStyle.solid)),
                                child: Icon(
                                  Icons.person,
                                  size: larguraPor(25, context),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Particular",
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(EntidadeLoginView());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: larguraPor(40, context),
                                height: larguraPor(40, context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black87,
                                        width: 2.0,
                                        style: BorderStyle.solid)),
                                child: Icon(
                                  Icons.build_rounded,
                                  size: larguraPor(25, context),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Profissional",
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: larguraPor(30, context),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: larguraPor(55, context),
                    ),
                    Container(
                      width: larguraPor(50, context),
                      height: larguraPor(28, context),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150),
                          topRight: Radius.circular(150),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_rounded),
                          TextButton(
                            onPressed: () {
                              Get.to(CreateSessionView());
                            },
                            child: Text(
                              "Encontre aqui o seu Profissional",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
